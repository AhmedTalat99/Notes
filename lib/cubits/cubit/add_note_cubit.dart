import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes/models/note_model.dart';
import 'package:flutter/material.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color? color = Colors.purple;
  addNote(NoteModel note) async {
    note.color = color!.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>('note_box');
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
