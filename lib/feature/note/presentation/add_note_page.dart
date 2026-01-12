import 'package:cleanarchitecture_noteapp/feature/note/cubit/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hint: Text("Title Here")),
            ),
            SizedBox(height: 5),
            TextField(
              controller: contentController,
              decoration: InputDecoration(hint: Text("Content Here")),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                context.read<NoteCubit>().createNote(
                  titleController.text,
                  contentController.text,
                );
                Navigator.pop(context);
              },
              child: Text("Add Note"),
            ),
          ],
        ),
      ),
    );
  }
}
