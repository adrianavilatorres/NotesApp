import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notas/models/Note.dart';
import 'package:notas/pages/NotesForm.dart';

class NotesList extends StatefulWidget {
  static final route = '/notesList';

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Notas'),
      ),
      body: _buildNotesListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newNote = await Navigator.pushNamed(context, NotesForm.route);
          if (newNote) {
            setState(() {});
          }
        },
      ),
    );
  }

  ListView _buildNotesListView() {
    return ListView.builder(
      itemCount: NOTES.length,
      itemBuilder: (context, index) {
        var note = NOTES[index];
        return Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Card(
              color: note.getMaterialColor(),
              elevation: 10,
              child: ListTile(
                title: Text(note.tittle),
                subtitle: Text(note.content),
              )),
        );
      },
    );
  }
}
