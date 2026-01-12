import 'package:cleanarchitecture_noteapp/feature/note/data/datasource/note_local_datasource.dart';
import 'package:cleanarchitecture_noteapp/feature/note/domain/respository/note_respository.dart';
import 'package:cleanarchitecture_noteapp/feature/note/model/note.dart';

class NoteRepositoryImpl implements NoteRespository {
  final NoteLocalDatasource nlc;
  NoteRepositoryImpl({
    required this.nlc,
  });

  @override
  Future<Note> createNote(String title, String content) async{
    return await nlc.createNote(title, content);
  }

  @override
  Future<void> deleteNoteById(int id) async{
    await nlc.deleteNoteById(id);
  }

  @override
  Future<List<Note>> getAllNotes() async {
    final resultNotes = await nlc.getAllNotes();
    return resultNotes.map((e) => Note.fromJson(e)).toList();
  }

  @override
  Future<Note> getNoteById(int id) async {
    final resultNote = await nlc.getNoteById(id);
    return resultNote;
  }

  @override
  Future<Note> updateNoteById(int id, String title, String content) async {
    return await nlc.updateNoteById(id, title, content);
  }
  
}
