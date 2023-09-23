import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/cubit/add_note_cubit.dart';
import 'package:notes/cubits/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/colors_list_view.dart';
import 'package:notes/widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Edit Note',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 15),
            child: FloatingActionButton(
              heroTag: 'editnoteview',
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.of(context).pop();
              },
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF383839),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              CustomTextField(
                hint: widget.note.title,
                onChanged: (value) => title = value,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: widget.note.subTitle,
                maxlines: 5,
                onChanged: (value) => subTitle = value,
              ),
              const SizedBox(height: 20),
              EditNoteColorsList(note: widget.note)
            ],
          ),
        ),
      ),
    );
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  List<Color> colors = [
    Colors.purple,
    Colors.yellow,
    Colors.green,
    Colors.blueAccent,
    Colors.teal,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2, // height = raius * 2
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = colors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
