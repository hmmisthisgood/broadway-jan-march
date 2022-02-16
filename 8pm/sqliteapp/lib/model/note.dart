class Note {
  int id;
  String title;
  String description;
  String? createdAt;
  String? updatedAt;

  static Note newNOte = Note(description: "", title: "", id: 1);

  Note(
      {required this.id,
      // this.createdAt,
      required this.title,
      required this.description,
      this.updatedAt});

  factory Note.convertMapToNote(Map noteMap) {
    return Note(
      id: noteMap['Id'],
      title: noteMap["Title"],
      description: noteMap["Description"],
      updatedAt: noteMap['UpatedAt'],
    );
  }
}

some() {
  Note newPost = Note(description: "", title: "", id: 1);
  newPost.title;
  newPost.description;
}
