import 'package:flutter/material.dart';
import 'package:notas/models/Note.dart';

class NotesForm extends StatefulWidget {
  static final route = '/notesForm';

  @override
  _NotesFormState createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Note note = Note();

  NoteColors _selectedColor = NoteColors.Blue;

  String _validateTitle(String value) {
    if (value == '') {
      return 'El titulo de la nota es obligatorio';
    }
    if (value.length < 4) {
      return 'El titulo de la nota no puede tener menos de 4 caracteres';
    }
  }

  saveForm(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      note.color = _selectedColor;
      NOTES.add(note);
      note = Note();
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Nueva Nota'),
      ),
      bottomNavigationBar: _buildBootomNavigationBar(context),
      body: Form(
        key: _formKey,
        child: Column(children: [
          ListTile(
              leading: Icon(Icons.title),
              title: TextFormField(
                  validator: _validateTitle,
                  onSaved: (newValue) => note.tittle = newValue,
                  decoration: InputDecoration(
                    hintText: 'Titulo de la nota',
                  ))),
          ListTile(
            leading: Icon(Icons.content_copy),
            title: TextFormField(
              onSaved: (newValue) => note.content = newValue,
              maxLines: 6,
              decoration: InputDecoration(hintText: 'Contenido de la nota'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.palette),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: NoteColors.values.map((NoteColors enumColor) {
                var tam = 35.0;
                if (enumColor == _selectedColor) {
                  tam = 50.0;
                }
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = enumColor;
                    });
                  },
                  child: Container(
                    width: tam,
                    height: tam,
                    color: Note.getMaterialEnumColor(enumColor),
                  ),
                );
              }).toList(),
            ),
          )
        ]),
      ),
    );
    return scaffold;
  }

  Padding _buildBootomNavigationBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
              onPressed: () => saveForm(context), child: Text('Guardar')),
          FlatButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Cancelar'))
        ],
      ),
    );
  }
}
