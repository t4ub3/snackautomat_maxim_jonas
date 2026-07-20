import 'dart:convert';
import 'package:path/path.dart';
import 'package:snackautomat/data/snack_db_model.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:sqflite/sqflite.dart';

part "database_strings.dart";

class DatabaseService {
  static Database? _db;
  static final DatabaseService db = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    _db ??= await _getDatabase();
    return _db!;
  }

  Future<Database> _getDatabase() async {
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath, "$_dbName.db");

    final db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(_createSnackTable);
      },
    );
    return db;
  }

  Future<void> addSnack(SnackDbModel snack) async {
    final db = await database;
    await db.insert(
      _snackTableName,
      {
        _nameColumnName: snack.name,
        _priceColumnName: snack.price,
        _fileAsBase64ColumnName: snack.imageAsBase64,
      },
    );
  }

  Future<List<SnackDbModel>?> getAll() async {
    final db = await database;
    final data = await db.query(_snackTableName);
    return Future.wait(
      data.map((row) async {
        return SnackDbModel(
          row[_idColumnName] as int,
          row[_nameColumnName] as String,
          row[_priceColumnName] as double,
          row[_fileAsBase64ColumnName] as String,
        );
      }).toList(),
    );
  }
}
