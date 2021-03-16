import 'package:flutter/material.dart';

enum NoteColors { Red, Green, Blue, Yello, Orange }

class Note {
  int id;
  String tittle;
  String content;
  NoteColors color;

  static final NoteColorMap = <NoteColors, Color>{
    NoteColors.Red: Colors.red,
    NoteColors.Blue: Colors.blue,
    NoteColors.Green: Colors.green,
    NoteColors.Orange: Colors.orange,
    NoteColors.Yello: Colors.yellow,
  };

  Note(
      {this.id,
      @required this.tittle = '',
      this.content = '',
      @required this.color = NoteColors.Blue});

  getMaterialColor() {
    return NoteColorMap[color];
  }

  static Color getMaterialEnumColor(NoteColors color) {
    return NoteColorMap[color];
  }
}

var NOTES = <Note>[
  Note(
      tittle: 'Crear Listview de Notas',
      content: 'Posteriormente se hará persistencia'),
  Note(
      tittle: 'Implementar Scoped Model',
      content: 'Estado con Scoped Model',
      color: NoteColors.Green)
];
