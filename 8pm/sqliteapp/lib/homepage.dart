import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import "package:logger/logger.dart";
import 'package:sqliteapp/util/db_service.dart';

import 'model/note.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  final logger = Logger();

  // List<Map<String, dynamic>> myNotes = [];

  List<Note> myNotesNotes = [];
  List users = [];

  @override
  void initState() {
    super.initState();
    checkPathsAndPrint();
  }

  // singleton class in dart

  checkPathsAndPrint() async {
    final docsDir = await getApplicationDocumentsDirectory();

    if (kDebugMode == true) {
      print(docsDir.path);
    }
  }

  createUserInDatabse() async {
    await DBService.instance.createUserInDatabse();
  }

  saveNote() async {
    final currentTime = DateTime.now();

    /// this is an invalid date format and it throws a Format Exception
    // DateTime.parse("2020 10 10");
    var value = "1";
    var intValue = int.parse(value); // 1
    var doubleValue = double.parse(value); //1.0

    var result = await DBService.instance.saveNote(
      title: titleController.text,
      description: desController.text,
    );
    print(result);
  }

  getNotes() async {
    final notesList = await DBService.instance.getNotes();

    // final tempNotesList = notesList.map((noteItem) {
    //   /// modify each item in the list
    //   /// and return the modified values in a brand new
    //   final convertedNote = Note.convertMapToNote(noteItem);
    //   return convertedNote;
    // }).toList();

    myNotesNotes = notesList;

    setState(() {});
    // logger.d(myNotes);
  }

  @override
  Widget build(BuildContext context) {
    logger.w("build function called");
    return Scaffold(
      body: Container(
        width: 500,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    createUserInDatabse();
                  },
                  icon: const Icon(
                    Icons.person_add,
                    size: 50,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    DBService.instance.getUsers();
                  },
                  icon: const Icon(
                    Icons.list,
                    size: 50,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title"),
                    TextField(
                      controller: titleController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text("Description"),
                    TextField(
                      controller: desController,
                    ),
                    Center(
                      child: MaterialButton(
                          onPressed: () => saveNote(),
                          color: Colors.green,
                          child: Text("Save")),
                    ),
                    Center(
                      child: MaterialButton(
                          onPressed: () => getNotes(),
                          color: Colors.blue,
                          child: Text("Get Notes")),
                    ),
                    Column(
                      // itemCount: myNotes.length,

                      children: List.generate(
                        myNotesNotes.length,
                        (index) {
                          // final note = myNotes[index];

                          final actualNote = myNotesNotes[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(note['tiwwtle'] ?? ""),
                                    // SizedBox(height: 5),
                                    // Text(note['Description'] ??
                                    //     "this is the note desciption")

                                    Text(actualNote.title),
                                    SizedBox(height: 5),
                                    Text(actualNote.description)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
