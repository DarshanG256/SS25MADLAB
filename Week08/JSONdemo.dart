// models/note.dart

class Note {
  String title;
  String content;

  Note({
    required this.title,
    required this.content,
  });

  // Convert Note → JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }

  // Convert JSON (Map) → Note
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      content: json['content'],
    );
  }
}
