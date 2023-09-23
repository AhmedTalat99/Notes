import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/cubit/add_note_cubit.dart';
import 'package:notes/cubits/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
/*
+ using BlocProvider here at place which is needed to it only,
it is useful to performance ,such that keeps resourses,
but if i used in material app ,it will be open and valid to all app
,then performance is poor
*/
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {}
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            // AbsorbPointer prevents user from and change when loading
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
