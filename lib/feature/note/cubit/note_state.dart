import 'package:cleanarchitecture_noteapp/feature/note/model/note.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_state.g.dart';


@CopyWith()
class NoteState extends Equatable {
  NoteState({this.notes = const [], this.currentNote});
  List<Note>? notes;
  Note? currentNote;
  @override
  List<Object?> get props => [notes, currentNote];
}

