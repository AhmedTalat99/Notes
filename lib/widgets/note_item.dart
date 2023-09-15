import 'package:flutter/material.dart';
import 'package:notes/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext ctx) {
    return GestureDetector(
      onTap: () {
        Navigator.push(ctx, MaterialPageRoute(builder: (ctx) {
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFCE79),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                'Flutter Tips',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              subtitle: const Text(
                'Build your career with Tharwat Samy',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 20,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, size: 24, color: Colors.black),
                onPressed: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text(
                'May21 , 2022',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
