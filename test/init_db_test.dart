import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/data/database_repository.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:snackautomat/models/transfer.dart';
import 'package:snackautomat/services/database_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

// run before first startup to create db and fill with initial data.

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
    }
    databaseFactory = databaseFactoryFfi;
  });

  test('store snacks in db', () async {
    // start from a clean, empty database
    await DatabaseService.db.resetDatabase();

    final container = ProviderContainer.test();

    // keeps the provider mounted for the duration of the test
    container.listen(snackListProvider, (_, _) {}, fireImmediately: true);

    File chipsBbqImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "chips-bbq-flavour.png")),
      ),
    );
    File chocolateImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "chocolate-bar.png")),
      ),
    );
    File crackersImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "crackers.png")),
      ),
    );
    File gummyBearsImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "gummy-bears.png")),
      ),
    );
    File licoriceImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "licorice.png")),
      ),
    );
    File marshmallowsImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "marshmallows.png")),
      ),
    );
    File nutAndBerryImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "nut-and-berry.png")),
      ),
    );
    File peanutImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "peanut-snacks.png")),
      ),
    );
    File chipsSaltPepperImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "salt-and-pepper-chips.png")),
      ),
    );

    Snack chipsBbq = Snack(name: "chipsBbq", price: 2.5, image: chipsBbqImg);
    Snack chocolate = Snack(name: "chocolate", price: 2.3, image: chocolateImg);
    Snack crackers = Snack(name: "crackers", price: 2.0, image: crackersImg);
    Snack gummyBears = Snack(
      name: "gummyBears",
      price: 2.0,
      image: gummyBearsImg,
    );
    Snack licorice = Snack(name: "licorice", price: 2.2, image: licoriceImg);
    Snack marshmallows = Snack(
      name: "marshmallows",
      price: 2.8,
      image: marshmallowsImg,
    );
    Snack nutAndBerry = Snack(
      name: "nutAndBerry",
      price: 2.6,
      image: nutAndBerryImg,
    );
    Snack peanut = Snack(name: "peanut", price: 1.9, image: peanutImg);
    Snack chipsSaltPepper = Snack(
      name: "chipsSaltPepper",
      price: 2.5,
      image: chipsSaltPepperImg,
    );

    await container.read(snackListProvider.notifier).addSnack(chipsBbq);
    await container.read(snackListProvider.notifier).addSnack(chocolate);
    await container.read(snackListProvider.notifier).addSnack(crackers);
    await container.read(snackListProvider.notifier).addSnack(gummyBears);
    await container.read(snackListProvider.notifier).addSnack(licorice);
    await container.read(snackListProvider.notifier).addSnack(marshmallows);
    await container.read(snackListProvider.notifier).addSnack(nutAndBerry);
    await container.read(snackListProvider.notifier).addSnack(peanut);
    await container.read(snackListProvider.notifier).addSnack(chipsSaltPepper);

    final data = container.read(snackListProvider);
    expect(data, isNotNull);

    // default money stock: 10 coins/notes of each denomination
    await container
        .read(databaseRepositoryProvider)
        .createTransfer(
          Transfer(
            description: "set base money stock",
            isIncome: true,
            ct5Amount: 10,
            ct10Amount: 10,
            ct20Amount: 10,
            ct50Amount: 10,
            eur1Amount: 10,
            eur2Amount: 10,
            sumInCt: 3850,
          ),
        );

    final stock = await container
        .read(databaseRepositoryProvider)
        .getCurrentStock();
    expect(stock.count5ct, 10);
    expect(stock.count10ct, 10);
    expect(stock.count20ct, 10);
    expect(stock.count50ct, 10);
    expect(stock.count100ct, 10);
    expect(stock.count200ct, 10);
  });
}
