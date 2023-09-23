import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubits/cubit/add_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/colors_list_view.dart';
import 'package:notes/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle; // user inputs
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            hint: 'Title',
            onTap: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 25),
          CustomTextField(
            hint: 'Content',
            maxlines: 5,
            onTap: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 32),
          const ColorsListView(),
          const SizedBox(height: 22),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.teal,
                ),
              ),
              onPressed: () {
                String dateofadd =
                    DateFormat('dd-mm-yyyy').format(DateTime.now());
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var noteModel = NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: dateofadd,
                    color: Colors.blue.value,
                  );
                  BlocProvider.of<AddNoteCubit>(context)
                      .addNote(noteModel); // trigger AddNoteCubit
                  isLoading = true;
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Add'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
