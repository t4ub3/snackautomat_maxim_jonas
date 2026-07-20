part of 'database_service.dart';

// SQL STATEMENTS

String _createSnackTable =
    '''
CREATE TABLE $_snackTableName (
$_idColumnName INTEGER PRIMARY KEY,
$_nameColumnName TEXT NOT NULL,
$_priceColumnName REAL NOT NULL,
$_fileAsBase64ColumnName TEXT NOT NULL
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

// CONSTANT NAMES OF DB, TABLES AND COLUMNS

const String _dbName = "snackautomat_db";

// snack table
const String _snackTableName = "snacks";
const String _idColumnName = "id";
const String _nameColumnName = "name";
const String _priceColumnName = "price";
const String _fileAsBase64ColumnName = "fileAsBase64";

// shelf table
const String _snackIdColumnName = "snackId";
