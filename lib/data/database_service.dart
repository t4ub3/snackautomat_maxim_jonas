import 'package:path/path.dart';
import 'package:snackautomat/models/snack.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

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
      onCreate: (db, version) {
        db.execute(_onCreateSql);
      },
    );
    return database;
  }

  void addSnack(Snack snack) async {
    final db = await database;
    await db.insert(
      "snacks",
      {
        "name": snack.name,
        "price": snack.price,
        "filepath": snack.image.path,
      },
    );
  }
}

String _onCreateSql = '''
CREATE TABLE snacks (
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
price REAL NOT NULL,
filepath TEXT,
)
''';
