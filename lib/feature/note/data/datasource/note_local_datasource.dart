import 'package:cleanarchitecture_noteapp/feature/note/model/note.dart';

abstract class NoteLocalDatasource {
  Future<List<Map<String, dynamic>>> getAllNotes();
  Future<Note> getNoteById(int id);
  Future<void> deleteNoteById(int id);
  Future<Note> createNote(String title, String content);
  Future<Note> updateNoteById(int id, String title, String content);
}
