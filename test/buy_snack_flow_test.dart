import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:snackautomat/application/money_provider.dart';
import 'package:snackautomat/data/database_repository.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:snackautomat/models/transfer.dart';
import 'package:snackautomat/presentation/vending_screen.dart';
import 'package:snackautomat/services/database_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  testWidgets('buying a snack decrements amount and writes db/transaction/moneyStock records', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // sqflite_common_ffi talks to a real, separate isolate, so the real
    // async work below has to run outside the fake-async test zone.
    await tester.runAsync(() async {
      final image = File(
        p.normalize(
          p.absolute(p.join('test', 'test_assets', 'pringles.png')),
        ),
      );

      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Seed one snack directly via the repository, priced so a single
      // 20ct coin covers it exactly (no change required).
      final created = await container
          .read(databaseRepositoryProvider)
          .createSnack(
            Snack(name: 'Pringles', price: 0.20, image: image, amount: 3),
          );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: Snackautomat()),
        ),
      );

      // Let the async snack list load (real delay, since we're inside
      // runAsync / the real event loop here).
      await Future.delayed(const Duration(milliseconds: 300));
      await tester.pump();

      // Other test files share the same on-disk sqlite file, so locate
      // this test's own tile by its unique price rather than assuming
      // it is the first one in the grid.
      final priceText = find.text('0.2€');
      expect(priceText, findsOneWidget);

      await tester.tap(
        find.ancestor(
          of: priceText,
          matching: find.byType(GestureDetector),
        ),
      );
      await tester.pump();

      expect(find.text('Preis: 0.2€'), findsOneWidget);

      await tester.tap(find.widgetWithText(OutlinedButton, '20ct'));
      await Future.delayed(const Duration(milliseconds: 300));
      await tester.pump();

      expect(find.text('Bitte Snack entnehmen!'), findsOneWidget);

      final dbService = DatabaseService.db;
      final snackAfter = await dbService.getSnackById(created.id!);
      expect(snackAfter.amount, 2);

      final stock = await dbService.getCurrentStock();
      expect(stock.count20ct, 1);
      expect(stock.getValueInCents(), 20);

      // Other test files share the same on-disk sqlite file, so read the
      // most recent transaction row rather than assuming id 1.
      final db = await dbService.database;
      final latestTransactionRows = await db.query(
        'transactions',
        orderBy: 'rowid DESC',
        limit: 1,
      );
      expect(latestTransactionRows, hasLength(1));
      final latestTransaction = latestTransactionRows.first;
      expect(latestTransaction['description'], 'Kauf: Pringles');
      expect(latestTransaction['isIncome'], 1);
      expect(latestTransaction['ct20Amount'], 1);
      expect(latestTransaction['sumInCt'], 20);
    });
  });

  testWidgets('change calculation is driven by the real money stock in the database', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.runAsync(() async {
      final image = File(
        p.normalize(
          p.absolute(p.join('test', 'test_assets', 'pringles.png')),
        ),
      );

      final container = ProviderContainer();
      addTearDown(container.dispose);
      final repository = container.read(databaseRepositoryProvider);
      final dbService = DatabaseService.db;

      // Snack priced so paying with a 2€ coin requires exactly 10ct change.
      final created = await repository.createSnack(
        Snack(name: 'Change Test Snack', price: 1.90, image: image, amount: 5),
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: Snackautomat()),
        ),
      );
      await Future.delayed(const Duration(milliseconds: 300));
      await tester.pump();

      final priceText = find.text('1.9€');
      expect(priceText, findsOneWidget);
      await tester.tap(
        find.ancestor(of: priceText, matching: find.byType(GestureDetector)),
      );
      await tester.pump();

      // Nothing has ever deposited a 10ct coin into the till at this
      // point, so the database's real stock cannot form 10ct change -
      // even though the old hardcoded default stock (which included
      // spare 20/50/100/200ct coins) would have been able to.
      await tester.tap(find.widgetWithText(OutlinedButton, '2€'));
      await Future.delayed(const Duration(milliseconds: 300));
      await tester.pump();

      expect(find.text('Kein Wechselgeld verfügbar!'), findsOneWidget);

      final snackAfterFailedAttempt = await dbService.getSnackById(
        created.id!,
      );
      expect(
        snackAfterFailedAttempt.amount,
        5,
        reason: 'purchase must not go through without real change available',
      );

      // Deposit a 10ct coin into the till (a real database write) and make
      // the app pick it up, then retry the same purchase attempt.
      await repository.createTransfer(
        Transfer(
          description: 'Seed: 10ct',
          isIncome: true,
          ct5Amount: 0,
          ct10Amount: 1,
          ct20Amount: 0,
          ct50Amount: 0,
          eur1Amount: 0,
          eur2Amount: 0,
          sumInCt: 10,
        ),
      );
      container.invalidate(coinStockProvider);

      await tester.tap(find.widgetWithText(OutlinedButton, 'bestätigen'));
      await Future.delayed(const Duration(milliseconds: 300));
      await tester.pump();

      expect(find.text('Bitte Snack entnehmen!'), findsOneWidget);

      final snackAfterSuccess = await dbService.getSnackById(created.id!);
      expect(snackAfterSuccess.amount, 4);

      final stock = await dbService.getCurrentStock();
      // previously seeded 10ct spent as change, 2€ coin taken as payment.
      expect(stock.count10ct, 0);
      expect(stock.count200ct, 1);
    });
  });
}
