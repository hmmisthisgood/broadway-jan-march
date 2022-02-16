import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import "package:logger/logger.dart";

import 'model/note.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Database ourDatabase;

  final titleController = TextEditingController();
  final desController = TextEditingController();
  final logger = Logger();

  List<Map<String, dynamic>> myNotes = [];
  List<Note> myNotesNotes = [];
  List users = [];

  @override
  void initState() {
    super.initState();
    checkPathsAndPrint();
    initAndOpenDatabase();
  }

  // singleton class in dart

  checkPathsAndPrint() async {
    final docsDir = await getApplicationDocumentsDirectory();

    if (kDebugMode == true) {
      print(docsDir.path);
    }
  }

  static const USER_ID = 'id';
  static const User_Table = "users";

  initAndOpenDatabase() async {
    final docsDir = await getTemporaryDirectory();

    final databseName = "our_test_database.db";

    ///data/users/0/com.something/app/our_test_databse.db

    /// data/Android/data/com.something/
    ///
    final databsePath = "${docsDir!.path}/$databseName";
    final int databaseVersion = 1;

    final database = await openDatabase(
      databsePath,
      version: databaseVersion,
      onConfigure: (db) async {
        print("on congigure called: ");
        try {
          await db.execute('''    
      CREATE TABLE IF NOT EXISTS $User_Table(
      Id INTEGER NOT NUll PRIMARY KEY AUTOINCREMENT,
      Fullname VARCHAR(50),
      DataOfBirth VARCHAR,
      Role VARCHAR, 
      Bio TEXT
      );
      ''');

          await db.execute('''
        CREATE TABLE IF NOT EXISTS notes(
        Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        Title VARCHAR(100),
        Description TEXT,
        CreateAt VARCHAR,
        UpatedAt VARCHAR
);
    ''');
        } on DatabaseException catch (e) {
          print(e.toString());
        }

        // ourDatabase = db;
      },
      onCreate: (db, version) async {
        // CRUd
        // create = db.insert/ db.rawInsert
        // read = db.query, db.rawQuery
        // update= db.update ,db.rawUpdate
        // delete= db.delete, db.rawDelete

        /// table creation
        ///  db.execute
        ///

//         print("on create called  with version: $version");

//         try {
//           await db.execute('''
//       CREATE TABLE IF NOT EXISTS $User_Table(
//       Id INTEGER NOT NUll PRIMARY KEY AUTOINCREMENT,
//       Fullname VARCHAR(50),
//       DataOfBirth VARCHAR,
//       Role VARCHAR,
//       Bio TEXT
//       );
//       ''');

//           await db.execute('''
//         CREATE TABLE IF NOT EXISTS notes(
//         Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
//         Title VARCHAR(100),
//         Description TEXT
//         CreateAt VARCHAR,
//         UpatedAt VARCHAR
// );
//     ''');
//         } on DatabaseException catch (e) {
//           print(e.toString());
//         }
      },
      onUpgrade: (db, oldVer, newVer) {
        print("on upgrade called with version: $oldVer new Version: $newVer");

        ///
        ///
        ///

        ////
        ///
        ///
        ///
        ///
        ///
      },
      onDowngrade: (db, oldVer, newVer) {
        print("on downgrade called with version: $oldVer new Version: $newVer");
      },
      onOpen: (db) {},
    );

    ourDatabase = database;
  }

  createUserInDatabse() async {
    print("adding a new user ");
    try {
      await ourDatabase.insert(User_Table, {
        "Fullname": "this is my fullname",
        "DataOfBirth": "2020-10-10",
        "Role": "Admin",
        "Bio": "I am a programmer"
      });
    } catch (e) {
      logger.e(e);
    }
  }

  getUsers() async {
    try {
      /// using ! (asert) this way is bad
      // await ourDatabase!.query(User_Table);

      /// this is a good way to user ! for not null assertion
      // if (ourDatabase != null) {
      //   await ourDatabase!.query(User_Table);
      // }

      final data = await ourDatabase.rawQuery('''SELECT * FROM $User_Table ''');
      print(data);
    } catch (e) {
      logger.e(e);
    }
  }

  saveNote() async {
    final currentTime = DateTime.now();

    /// this is an invalid date format and it throws a Format Exception
    // DateTime.parse("2020 10 10");
    var value = "1";
    var intValue = int.parse(value); // 1
    var doubleValue = double.parse(value); //1.0

    await ourDatabase.insert("notes", {
      "Title": titleController.text,
      "Description": desController.text,
      // "CreateAt": currentTime.toString()
    });
  }

  getNotes() async {
    final notesList = await ourDatabase.query("notes");
    // List.generate();

    /// Note = Map<String, Object>
    myNotes = notesList;

    final tempNotesList = notesList.map((noteItem) {
      /// modify each item in the list
      /// and return the modified values in a brand new
      final convertedNote = Note.convertMapToNote(noteItem);
      return convertedNote;
    }).toList();

    myNotesNotes = tempNotesList;

    setState(() {});
    logger.d(myNotes);
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
                  icon: Icon(
                    Icons.person_add,
                    size: 50,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    getUsers();
                  },
                  icon: Icon(
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
                        myNotes.length,
                        (index) {
                          final note = myNotes[index];
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
