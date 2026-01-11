import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();
  static Database? _db;
  final String _databaseTableName = "notes";
  final String _idColumnName = "id";
  final String _titleColumnName = "title";
  final String _contentColumnName = "content";
  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await fetchDatabase();
    return _db!;
  }

  Future<Database> fetchDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "note_db.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) => {
        ''' CREATE TABLE $_databaseTableName
        $_idColumnName INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $_titleColumnName TEXT NOT NULL,
        $_contentColumnName TEXT NOT NULL
''',
      },
    );
    return database;
  }
}
