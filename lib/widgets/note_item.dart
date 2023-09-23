import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return  EditNoteView(
                note: note,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              subtitle: Text(
                note.subTitle,
                style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 20,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, size: 24, color: Colors.black),
                onPressed: () {
                  note.delete(); // i could call delete because i made NoteModel extends HiveObject
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                note.date,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
