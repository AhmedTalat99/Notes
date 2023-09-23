import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes/widgets/notes_list_view.dart';

import '../widgets/add_note_bottom_sheet.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 15),
            child: FloatingActionButton(
              heroTag: 'appbarnoteview',
              onPressed: () {},
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF383839),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: NotesListView()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'noteview',
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
