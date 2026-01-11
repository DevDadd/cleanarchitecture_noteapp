import 'package:cleanarchitecture_noteapp/feature/note/data/datasource/note_local_datasource_impl.dart';
import 'package:cleanarchitecture_noteapp/feature/note/model/note.dart';

class NoteRespository {
  final NoteLocalDatasourceImpl nlc;
  NoteRespository({required this.nlc});

  Future<List<Note>> getAllNotes() async {
    final noteResult = await nlc.getAllNotes();
    return noteResult.map((e) => Note.fromJson(e)).toList();
  }

  Future<Note> getNoteById(int id) async {
    final res = await nlc.getNoteById(id);
    return res;
  }
}
