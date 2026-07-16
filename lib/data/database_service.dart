import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService db = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    _db ??= await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath, "snackautomat_db.db");

    final db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(_createSnackTable);
      },
    );
    return db;
  }

  Future<void> addSnack(Snack snack) async {
    final db = await database;
    final blob = base64Encode(await snack.image.readAsBytes());
    await db.insert(
      "snacks",
      {
        "name": snack.name,
        "price": snack.price,
        "fileAsBase64": blob,
      },
    );
  }

  Future<List<Snack>?> getAll() async {
    final db = await database;
    final data = await db.query("snacks");
    return Future.wait(
      data.map((row) async {
        final base64Str = row["fileAsBase64"] as String;

        File image;
        final bytes = base64Decode(base64Str);
        final dir = await Directory.systemTemp.createTemp('snack_test');
        image = File(join(dir.path, "${row["name"]}.png"));
        await image.writeAsBytes(bytes);

        return Snack(
          id: row["id"] as int,
          name: row["name"] as String,
          price: row["price"] as double,
          image: image,
        );
      }).toList(),
    );
  }
}

String _createSnackTable = '''
CREATE TABLE snacks (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
price REAL NOT NULL,
fileAsBase64 TEXT NOT NULL
);
''';

String _createShelfTable = '''
CREATE TABLE shelf (
id INTEGER PRIMARY KEY,
snackId INTEGER NOT NULL,
number INTEGER NOT NULL,
maxCapacity INTEGER NOT NULL,
currentFill INTEGER DEFAULT 0
);
''';
