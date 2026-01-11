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
    return db.query("notes");
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
  Future<void> createNote(String title, String content) async {
    final db = await _db.database;
    await db.insert("notes", {
      title: 'title',
      content: 'content',
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> updateNoteById(int id, String title, String content) async {
    final db = await _db.database;
    await db.update(
      "notes",
      {title: 'title', content: 'content'},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
