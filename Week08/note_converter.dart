// repository/note_converter.dart

import 'dart:convert';
import '../models/note.dart';

// Convert Note object → JSON string
String noteToJson(Note note) {
  final map = note.toJson();
  return json.encode(map);
}

// Convert JSON string → Note object
Note noteFromJson(String jsonString) {
  final map = json.decode(jsonString);
  return Note.fromJson(map);
}
