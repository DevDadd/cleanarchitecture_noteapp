// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cleanarchitecture_noteapp/feature/note/domain/respository/note_respository.dart';
import 'package:cleanarchitecture_noteapp/feature/note/model/note.dart';

class NoteUsecase {
  final NoteRepository nrp;
  NoteUsecase({required this.nrp});
  Future<List<Note>> getAllNotes() {
    return nrp.getAllNotes();
  }

  Future<Note> getNoteById(int id) {
    return nrp.getNoteById(id);
  }

  Future<void> deleteNoteById(int id) {
    return nrp.deleteNoteById(id);
  }

  Future<Note> createNote(String title, String content) {
    return nrp.createNote(title, content);
  }

  Future<Note> updateNoteById(int id, String title, String content) {
    return nrp.updateNoteById(id, title, content);
  }
}
