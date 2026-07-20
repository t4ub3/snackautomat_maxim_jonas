import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snackautomat/application/snack_provider.dart';
import 'package:snackautomat/data/database_service.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
    }
    databaseFactory = databaseFactoryFfi;
  });

  test('add and read data from db', () async {
    final container = ProviderContainer.test();

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

    // final DatabaseService dbService = DatabaseService.db;

    // await dbService.addSnack(pringles);
    // await dbService.addSnack(haribo);
    // await dbService.addSnack(ritterSport);

    // final data = await dbService.getAll();
    final data = container.read(snackListProvider);
    print(data);
    expect(data, isNotNull);
  });
}
