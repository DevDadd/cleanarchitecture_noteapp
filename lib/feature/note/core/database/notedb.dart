import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();
  static Database? _db;
  final String databaseTableName = "notes";
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
      onCreate: (db, version) async {
        await db.execute('''
    CREATE TABLE $databaseTableName (
      $_idColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
      $_titleColumnName TEXT NOT NULL,
      $_contentColumnName TEXT NOT NULL
    )
  ''');
      },
    );
    return database;
  }
}
