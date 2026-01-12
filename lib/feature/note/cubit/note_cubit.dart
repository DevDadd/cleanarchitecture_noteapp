import 'package:bloc/bloc.dart';
import 'package:cleanarchitecture_noteapp/feature/note/cubit/note_state.dart';
import 'package:cleanarchitecture_noteapp/feature/note/domain/usecase/note_usecase.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteUsecase nus;
  NoteCubit(this.nus) : super(NoteState());

  Future<void> getAllNotes() async {
    final notes = await nus.getAllNotes();
    emit(state.copyWith(notes: notes));
  }

  Future<void> deleteNoteById(int id) async {
    await nus.deleteNoteById(id);

    final updatedNotes = state.notes?.where((note) => note.id != id).toList();

    emit(state.copyWith(notes: updatedNotes));
  }

  Future<void> updateNoteById(int id, String title, String content) async {
    final updatedNote = await nus.updateNoteById(id, title, content);

    final updatedNotes = state.notes
        ?.map((note) => note.id == id ? updatedNote : note)
        .toList();

    emit(state.copyWith(notes: updatedNotes));
  }

  Future<void> getNoteById(int id) async {
    final noteResult = await nus.getNoteById(id);
    emit(state.copyWith(currentNote: noteResult));
  }

  Future<void> createNote(String title, String content) async {
    final createdNote = await nus.createNote(title, content);
    final updatedNotes = [...?state.notes, createdNote];
    emit(state.copyWith(notes: updatedNotes));
  }
}
