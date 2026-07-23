part of '../services/database_service.dart';

// SQL STATEMENTS - INIT TABLES

String _createSnackTable =
    '''
CREATE TABLE $_snackTableName (
$_idColumnName INTEGER PRIMARY KEY,
$_nameColumnName TEXT NOT NULL,
$_priceColumnName REAL NOT NULL,
$_fileAsBase64ColumnName TEXT NOT NULL
);
''';

String _createShelfTable =
    '''
CREATE TABLE $_shelfTableName (
$_idColumnName INTEGER PRIMARY KEY,
$_snackIdColumnName INTEGER NOT NULL REFERENCES $_snackTableName,
$_positionColumnName INTEGER NOT NULL,
$_currentFillColumnName INTEGER DEFAULT 0
);
''';

String _createTransactionTable =
    '''
CREATE TABLE $_transactionTableName (
$_idColumnName INTEGER PRIMARY KEY,
$_descriptionColumnName TEXT NOT NULL,
$_isIncomeColumnName INTEGER NOT NULL,
$_5ctCountColumnName INTEGER NOT NULL DEFAULT 0,
$_10ctCountColumnName INTEGER NOT NULL DEFAULT 0,
$_20ctCountColumnName INTEGER NOT NULL DEFAULT 0,
$_50ctCountColumnName INTEGER NOT NULL DEFAULT 0,
$_1eurCountColumnName INTEGER NOT NULL DEFAULT 0,
$_2eurCountColumnName INTEGER NOT NULL DEFAULT 0,
$_sumColumnName GENERATED ALWAYS AS (($_5ctCountColumnName * 5) + ($_10ctCountColumnName * 10) + ($_20ctCountColumnName * 20) + ($_50ctCountColumnName * 50) + ($_1eurCountColumnName * 100) + ($_2eurCountColumnName * 200)) STORED
);
''';

String _createMoneyStockTable =
    '''
CREATE TABLE $_moneyStockTableName (
$_idColumnName INTEGER PRIMARY KEY,
$_latestTransactionIdColumnName INTEGER NOT NULL REFERENCES $_transactionTableName,
$_5ctCountColumnName INTEGER NOT NULL DEFAULT 0,
$_10ctCountColumnName INTEGER NOT NULL DEFAULT 0,
$_20ctCountColumnName INTEGER NOT NULL DEFAULT 0,
$_50ctCountColumnName INTEGER NOT NULL DEFAULT 0,
$_1eurCountColumnName INTEGER NOT NULL DEFAULT 0,
$_2eurCountColumnName INTEGER NOT NULL DEFAULT 0,
$_sumColumnName GENERATED ALWAYS AS (($_5ctCountColumnName * 5) + ($_10ctCountColumnName * 10) + ($_20ctCountColumnName * 20) + ($_50ctCountColumnName * 50) + ($_1eurCountColumnName * 100) + ($_2eurCountColumnName * 200)) STORED
);
''';

// SQL STATEMENTS - QUERIES

String _getById(int id, String table) {
  return "SELECT * FROM $table WHERE id = $id";
}

// CONSTANT NAMES OF DB, TABLES AND COLUMNS

const String _dbName = "snackautomat_db";

// snack table
const String _snackTableName = "snacks";
const String _idColumnName = "id";
const String _nameColumnName = "name";
const String _priceColumnName = "price";
const String _fileAsBase64ColumnName = "fileAsBase64";

// shelf table
const String _shelfTableName = "shelfs";
const String _snackIdColumnName = "snackId";
const String _positionColumnName = "position";
const String _currentFillColumnName = "currentFill";

// transaction table
const String _transactionTableName = "transactions";
const String _descriptionColumnName = "description";
const String _isIncomeColumnName = "isIncome";
const String _5ctCountColumnName = "ct5Amount";
const String _10ctCountColumnName = "ct10Amount";
const String _20ctCountColumnName = "ct20Amount";
const String _50ctCountColumnName = "ct50Amount";
const String _1eurCountColumnName = "eur1Amount";
const String _2eurCountColumnName = "eur2Amount";
const String _sumColumnName = "sumInCt";

// money stock table

const String _moneyStockTableName = "moneyStock";
const String _latestTransactionIdColumnName = "latestTransactionId";
