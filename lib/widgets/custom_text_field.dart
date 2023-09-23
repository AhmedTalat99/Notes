import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, required this.hint, this.maxlines = 1, this.onTap,this.onChanged});
  final String hint;
  final int maxlines;
  void Function(String?)? onTap;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    Color tc = Colors.teal;
    return TextFormField(
      onChanged: onChanged,
      onSaved: onTap,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: tc,
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: tc),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(tc),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
