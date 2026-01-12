import 'package:cleanarchitecture_noteapp/feature/note/cubit/note_cubit.dart';
import 'package:cleanarchitecture_noteapp/feature/note/cubit/note_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteDetailPage extends StatefulWidget {
  int id;
  NoteDetailPage({super.key, required this.id});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NoteCubit>().getNoteById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        final current = state.currentNote;
        if (state.currentNote == null) {
          return Scaffold(body: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(current!.title ?? ""),
                SizedBox(height: 5),
                Text(current.content ?? ""),
              ],
            ),
          ),
        );
      },
    );
  }
}
