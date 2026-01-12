// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NoteStateCWProxy {
  NoteState notes(List<Note>? notes);

  NoteState currentNote(Note? currentNote);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `NoteState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// NoteState(...).copyWith(id: 12, name: "My name")
  /// ```
  NoteState call({List<Note>? notes, Note? currentNote});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfNoteState.copyWith(...)` or call `instanceOfNoteState.copyWith.fieldName(value)` for a single field.
class _$NoteStateCWProxyImpl implements _$NoteStateCWProxy {
  const _$NoteStateCWProxyImpl(this._value);

  final NoteState _value;

  @override
  NoteState notes(List<Note>? notes) => call(notes: notes);

  @override
  NoteState currentNote(Note? currentNote) => call(currentNote: currentNote);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `NoteState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// NoteState(...).copyWith(id: 12, name: "My name")
  /// ```
  NoteState call({
    Object? notes = const $CopyWithPlaceholder(),
    Object? currentNote = const $CopyWithPlaceholder(),
  }) {
    return NoteState(
      notes: notes == const $CopyWithPlaceholder()
          ? _value.notes
          // ignore: cast_nullable_to_non_nullable
          : notes as List<Note>?,
      currentNote: currentNote == const $CopyWithPlaceholder()
          ? _value.currentNote
          // ignore: cast_nullable_to_non_nullable
          : currentNote as Note?,
    );
  }
}

extension $NoteStateCopyWith on NoteState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfNoteState.copyWith(...)` or `instanceOfNoteState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NoteStateCWProxy get copyWith => _$NoteStateCWProxyImpl(this);
}
