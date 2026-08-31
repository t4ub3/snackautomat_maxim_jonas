import 'package:path/path.dart';
import 'package:snackautomat/data/snack_db_model.dart';
import 'package:snackautomat/models/sum_of_money.dart';
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
    int transferId = await db.insert(
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
    SumOfMoney currentStock = await getCurrentStock();
    final sign = transfer.isIncome ? 1 : -1;
    SumOfMoney newStock = SumOfMoney(
      count200ct: currentStock.count200ct + (sign * transfer.eur2Amount),
      count100ct: currentStock.count100ct + (sign * transfer.eur1Amount),
      count50ct: currentStock.count50ct + (sign * transfer.ct50Amount),
      count20ct: currentStock.count20ct + (sign * transfer.ct20Amount),
      count10ct: currentStock.count10ct + (sign * transfer.ct10Amount),
      count5ct: currentStock.count5ct + (sign * transfer.ct5Amount),
    );
    final newStockId = addStock(newStock);
    return transferId;
  }

  Future<Transfer> getTransferById(int id) async {
    final db = await database;
    final data = await db.query(_transactionTableName, where: "id = $id");
    final results = await Future.wait(
      data.map((row) async {
        return Transfer(
          id: row[_idColumnName] as int,
          description: row[_descriptionColumnName] as String,
          isIncome: row[_isIncomeColumnName] == 1,
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

  Future<void> deleteTransfers() async {
    final db = await database;
    await db.delete(_transactionTableName);
  }

  Future<SumOfMoney> getCurrentStock() async {
    final db = await database;
    final data = await db.query(
      _moneyStockTableName,
      orderBy: "rowid DESC",
      limit: 1,
    );

    final results = await Future.wait(
      data.map((row) async {
        return SumOfMoney(
          count5ct: row[_5ctCountColumnName] as int,
          count10ct: row[_10ctCountColumnName] as int,
          count20ct: row[_20ctCountColumnName] as int,
          count50ct: row[_50ctCountColumnName] as int,
          count100ct: row[_1eurCountColumnName] as int,
          count200ct: row[_2eurCountColumnName] as int,
        );
      }).toList(),
    );
    return results.first;
  }

  Future<int> addStock(SumOfMoney money) async {
    final db = await database;
    final latestTransaction = await db.query(
      _transactionTableName,
      orderBy: "rowid DESC",
      limit: 1,
    );
    final latestTransactionId = latestTransaction[0][_idColumnName] as int;
    return await db.insert(
      _moneyStockTableName,
      {
        _latestTransactionIdColumnName: latestTransactionId,
        _5ctCountColumnName: money.count5ct,
        _10ctCountColumnName: money.count10ct,
        _20ctCountColumnName: money.count20ct,
        _50ctCountColumnName: money.count50ct,
        _1eurCountColumnName: money.count100ct,
        _2eurCountColumnName: money.count200ct,
      },
    );
  }

  Future<void> deleteStock() async {
    final db = await database;
    await db.delete(_moneyStockTableName);
  }
}
