import 'package:flutter/material.dart';
import 'package:notas/pages/NotesForm.dart';
import 'package:notas/pages/NotesList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesApp',
      theme: ThemeData(primaryColor: Colors.yellow, accentColor: Colors.orange),
      routes: {
        NotesList.route: (context) => NotesList(),
        NotesForm.route: (context) => NotesForm(),
      },
      home: NotesList(),
    );
  }
}
