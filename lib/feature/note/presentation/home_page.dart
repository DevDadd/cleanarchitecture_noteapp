import 'package:cleanarchitecture_noteapp/feature/note/cubit/note_cubit.dart';
import 'package:cleanarchitecture_noteapp/feature/note/cubit/note_state.dart';
import 'package:cleanarchitecture_noteapp/feature/note/presentation/add_note_page.dart';
import 'package:cleanarchitecture_noteapp/feature/note/presentation/note_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NoteCubit>().getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      buildWhen: (p, c) => p.notes != c.notes,
      builder: (context, state) {
        if (state.notes!.isEmpty) {
          return Scaffold(
            body: Center(
              child: Text(
                "NO NOTES TO SHOW",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNotePage()),
                );
              },
              child: Icon(Icons.add),
            ),
          );
        } else {
          return Scaffold(
            body: ListView.builder(
              itemCount: state.notes!.length,
              itemBuilder: (context, index) {
                final note = state.notes![index];
                return ListTile(
                  title: Text(note.title ?? ""),
                  subtitle: Text(note.content ?? ""),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<NoteCubit>().deleteNoteById(note.id!);
                        },
                        icon: Icon(Icons.delete),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NoteDetailPage(id: note.id!),
                            ),
                          );
                        },
                        icon: Icon(Icons.density_small_rounded),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNotePage()),
                );
              },
              child: Icon(Icons.add),
            ),
          );
        }
      },
    );
  }
}
