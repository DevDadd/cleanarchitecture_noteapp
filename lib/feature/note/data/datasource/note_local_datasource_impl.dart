import 'package:cleanarchitecture_noteapp/feature/note/core/database/notedb.dart';
import 'package:cleanarchitecture_noteapp/feature/note/data/datasource/note_local_datasource.dart';
import 'package:cleanarchitecture_noteapp/feature/note/model/note.dart';
import 'package:sqflite/sql.dart';

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
    final res = await db.query("notes", where: "id = ?", whereArgs: [id]);
    return Note.fromJson(res.first);
  }

  @override
  Future<void> deleteNoteById(int id) async {
    final db = await _db.database;
    await db.delete("notes", where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<Note> createNote(String title, String content) async {
    final db = await _db.database;
    final id = await db.insert("notes", {
      'title' : title,
      'content': content,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    return Note(
      id: id,
      title: title,
      content: content,
    );
  }

  @override
  Future<Note> updateNoteById(int id, String title, String content) async {
    final db = await _db.database;

    await db.update(
      'notes',
      {'title': title, 'content': content},
      where: 'id = ?',
      whereArgs: [id],
    );

    final result = await db.query(
      'notes',
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
