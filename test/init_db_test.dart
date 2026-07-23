import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/models/snack.dart';
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
    final container = ProviderContainer.test();

    // keeps the provider mounted for the duration of the test
    container.listen(snackListProvider, (_, _) {}, fireImmediately: true);

    File pringlesImg = File(
      p.normalize(p.absolute(p.join("test", "test_assets", "pringles.png"))),
    );
    File hariboImg = File(
      p.normalize(p.absolute(p.join("test", "test_assets", "haribo.png"))),
    );
    File ritterSportImg = File(
      p.normalize(
        p.absolute(p.join("test", "test_assets", "ritter-sport.png")),
      ),
    );

    Snack pringles = Snack(name: "pringles", price: 1.5, image: pringlesImg);
    Snack haribo = Snack(name: "haribo", price: 1.5, image: hariboImg);
    Snack ritterSport = Snack(
      name: "ritterSport",
      price: 1.5,
      image: ritterSportImg,
    );

    await container.read(snackListProvider.notifier).addSnack(pringles);
    await container.read(snackListProvider.notifier).addSnack(haribo);
    await container.read(snackListProvider.notifier).addSnack(ritterSport);

    final data = container.read(snackListProvider);
    expect(data, isNotNull);
  });
}
