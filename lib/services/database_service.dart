import 'package:path/path.dart';
import 'package:snackautomat/data/snack_db_model.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:snackautomat/models/transfer.dart';

import 'package:sqflite/sqflite.dart';

part "../data/database_strings.dart";

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
        await db.execute(_createShelfTable);
        await db.execute(_createTransactionTable);
        await db.execute(_createMoneyStockTable);
      },
    );
    return db;
  }

  Future<int> addSnack(SnackDbModel snack) async {
    final db = await database;
    return await db.insert(
      _snackTableName,
      {
        _nameColumnName: snack.name,
        _priceColumnName: snack.price,
        _fileAsBase64ColumnName: snack.imageAsBase64,
      },
    );
  }

  Future<List<SnackDbModel>?> getAllSnacks() async {
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

  Future<SnackDbModel> getSnackById(int id) async {
    final db = await database;
    final data = await db.query(_snackTableName, where: "id = $id");
    final results = await Future.wait(
      data.map((row) async {
        return SnackDbModel(
          row[_idColumnName] as int,
          row[_nameColumnName] as String,
          row[_priceColumnName] as double,
          row[_fileAsBase64ColumnName] as String,
        );
      }).toList(),
    );
    return results.first;
  }

  Future<int> addTransfer(Transfer transfer) async {
    final db = await database;
    return await db.insert(
      _transactionTableName,
      {
        _descriptionColumnName: transfer.description,
        _isIncomeColumnName: transfer.isIncome ? 1 : 0,
        _5ctCountColumnName: transfer.ct5Amount,
        _10ctCountColumnName: transfer.ct10Amount,
        _20ctCountColumnName: transfer.ct20Amount,
        _50ctCountColumnName: transfer.ct50Amount,
        _1eurCountColumnName: transfer.eur1Amount,
        _2eurCountColumnName: transfer.eur2Amount,
      },
    );
  }

  Future<Transfer> getTransferById(int id) async {
    final db = await database;
    final data = await db.query(_transactionTableName, where: "id = $id");
    final results = await Future.wait(
      data.map((row) async {
        return Transfer(
          id: row[_idColumnName] as int,
          description: row[_descriptionColumnName] as String,
          isIncome: row[_isIncomeColumnName] as bool,
          ct5Amount: row[_5ctCountColumnName] as int,
          ct10Amount: row[_10ctCountColumnName] as int,
          ct20Amount: row[_20ctCountColumnName] as int,
          ct50Amount: row[_50ctCountColumnName] as int,
          eur1Amount: row[_1eurCountColumnName] as int,
          eur2Amount: row[_2eurCountColumnName] as int,
          sumInCt: row[_sumColumnName] as int,
        );
      }).toList(),
    );
    return results.first;
  }
}
