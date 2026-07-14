import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:snackautomat/data/database_service.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  Snack snack = Snack(name: "Pringles", price: 1.5, image: null);
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }

  databaseFactory = databaseFactoryFfi;
  final DatabaseService dbService = DatabaseService.db;

  test('add and read data from db', () {
    dbService.addSnack(snack);
    final data = dbService.getAll();
    print(data);
    expect(data, isNotNull);
  });
}
