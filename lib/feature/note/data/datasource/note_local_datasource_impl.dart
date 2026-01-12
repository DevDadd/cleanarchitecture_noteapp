import 'package:cleanarchitecture_noteapp/feature/note/core/database/notedb.dart';
import 'package:cleanarchitecture_noteapp/feature/note/data/datasource/note_local_datasource.dart';
import 'package:cleanarchitecture_noteapp/feature/note/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteLocalDatasourceImpl implements NoteLocalDatasource {
  final DatabaseService _db;
  NoteLocalDatasourceImpl(this._db);

  @override
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final db = await _db.database;
    return db.query(_db.databaseTableName);
  }

  @override
  Future<Note> getNoteById(int id) async {
    final db = await _db.database;
    final res = await db.query(
      _db.databaseTableName,
      where: "id = ?",
      whereArgs: [id],
    );
    if (res.isEmpty) {
      throw Exception("Cant get note by ID $id");
    }
    return Note.fromJson(res.first);
  }

  @override
  Future<void> deleteNoteById(int id) async {
    final db = await _db.database;
    await db.delete(_db.databaseTableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<Note> createNote(String title, String content) async {
    final db = await _db.database;
    final id = await db.insert(_db.databaseTableName, {
      _db.titleColumnName: title,
      _db.contentColumnName: content,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    return Note(id: id, title: title, content: content);
  }

  @override
  Future<Note> updateNoteById(int id, String title, String content) async {
    final db = await _db.database;

    await db.update(
      _db.databaseTableName,
      {_db.titleColumnName: title, _db.contentColumnName: content},
      where: 'id = ?',
      whereArgs: [id],
    );

    final result = await db.query(
      _db.databaseTableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) {
      throw Exception('Note not found after update');
    }

    return Note.fromJson(result.first);
  }
}
