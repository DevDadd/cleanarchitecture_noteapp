import 'package:cleanarchitecture_noteapp/feature/note/data/datasource/note_repository_impl.dart';
import 'package:cleanarchitecture_noteapp/feature/note/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/note/cubit/note_cubit.dart';
import 'feature/note/domain/usecase/note_usecase.dart';
import 'feature/note/data/datasource/note_local_datasource_impl.dart';
import 'feature/note/core/database/notedb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databaseService = DatabaseService.instance;
  final noteLocalDatasource = NoteLocalDatasourceImpl(databaseService);
  final noteRepository = NoteRepositoryImpl(nlc: noteLocalDatasource);
  final noteUsecase = NoteUsecase(nrp: noteRepository);

  runApp(MyApp(noteUsecase: noteUsecase));
}

class MyApp extends StatelessWidget {
  final NoteUsecase noteUsecase;

  const MyApp({super.key, required this.noteUsecase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NoteCubit(noteUsecase),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
