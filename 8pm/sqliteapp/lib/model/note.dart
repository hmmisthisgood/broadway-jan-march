class Note {
  int id;
  String title;
  String description;
  String? updatedAt;
  String? randomValue;
  static Note newNOte = Note(
    description: "",
    title: "",
    id: 1,
  );
// java type getter setter
  // int getId() {
  //   return _id;
  // }

  // setId(int newValue) {
  //   _id = newValue;
  // }

  /// getter setters in dart
  // int get actualId => _id;

  // set id(int newId) {
  //   id = newId;
  // }

  Note(
      {required this.id,
      // this.createdAt,
      required this.title,
      required this.description,
      this.updatedAt,
      this.randomValue});

  factory Note.convertMapToNote(Map noteMap) {
    var amap = {
      'Id': 1,
      "Title": "movies list",
      "Description": "these are movies",
      "UpatedAt": ""
    };

    return Note(
      randomValue: noteMap["Description"],
      id: noteMap['Id'] ?? -1,
      title: noteMap["Title"] ?? "",
      description: noteMap["Description"] ?? "",
      updatedAt: noteMap['UpatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {"Title": title, "Description": description, "UpatedAt": updatedAt};
  }

  Note copyWith({String? description, String? title}) {
    return Note(
      description: description ?? this.description,
      id: this.id,
      title: title ?? this.title,
    );
  }
}

some() {
  Note newPost = Note(
      description: "this is note description",
      title: "this is test title",
      id: 1);

  newPost.title = "new title";
  newPost.description = "new desctiption";

  Note newNote = newPost.copyWith(title: "new title");

  // newNote.getId();
  // newNote.setId(3);

  // newNote.actualId;
  newNote.id = 11;

  Note noteWithNewDes = newPost.copyWith(description: "new description");

  Map newPostMap = newPost.toMap();
}
