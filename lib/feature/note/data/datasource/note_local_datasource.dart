import 'package:cleanarchitecture_noteapp/feature/note/core/database/notedb.dart';
import 'package:cleanarchitecture_noteapp/feature/note/model/note.dart';

abstract class NoteLocalDatasource {
  Future<List<Map<String, dynamic>>> getAllNotes();
  Future<Note> getNoteById(int id);
  Future<void> deleteNoteById(int id);
  Future<void> createNote(String title, String content);
  Future<void> updateNoteById(int id, String title, String content);
}
