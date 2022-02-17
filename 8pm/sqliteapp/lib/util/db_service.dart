import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqliteapp/model/note.dart';

class DBService {
  static const _USER_ID = 'id';
  static const _User_Table = "users";

  final logger = Logger();
  late Database ourDatabase;

  static const _databaseName = "our_test_database.db";

  DBService.custom();

  static final DBService _instance = DBService.custom();

  static DBService get instance => _instance;

  final createUsersTable = '''    
      CREATE TABLE IF NOT EXISTS $_User_Table(
      Id INTEGER NOT NUll PRIMARY KEY AUTOINCREMENT,
      Fullname VARCHAR(50),
      DataOfBirth VARCHAR,
      Role VARCHAR, 
      Bio TEXT
      );
      ''';

  final createNotesTable = '''
        CREATE TABLE IF NOT EXISTS notes(
        Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        Title VARCHAR(100),
        Description TEXT,
        CreateAt VARCHAR,
        UpatedAt VARCHAR
);
    ''';

  initAndOpenDatabase() async {
    final docsDir = await getTemporaryDirectory();

    ///data/users/0/com.something/app/our_test_databse.db

    /// data/Android/data/com.something/
    ///
    final databsePath = "${docsDir.path}/$_databaseName";
    final int databaseVersion = 1;

    final database = await openDatabase(
      databsePath,
      version: databaseVersion,
      onConfigure: (db) async {
        print("on congigure called: ");
        try {
          await db.execute(createUsersTable);
          await db.execute(createNotesTable);
        } on DatabaseException catch (e) {
          print(e.toString());
        }
      },
      onCreate: (db, version) async {},
      onUpgrade: (db, oldVer, newVer) {
        print("on upgrade called with version: $oldVer new Version: $newVer");

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
      await ourDatabase.insert(_User_Table, {
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

      final data = await ourDatabase.rawQuery('''SELECT * FROM $_User_Table ''');
      print(data);
    } catch (e) {
      logger.e(e);
    }
  }

  saveNote({String? title, String? description}) async {
    final currentTime = DateTime.now();

    /// this is an invalid date format and it throws a Format Exception
    // DateTime.parse("2020 10 10");
    var value = "1";
    var intValue = int.parse(value); // 1
    var doubleValue = double.parse(value); //1.0

    return await ourDatabase
        .insert("notes", {"Title": title, "Description": description});
  }

  Future<List<Note>> getNotes() async {
    final notesList = await ourDatabase.query("notes");

    final tempNotesList = notesList.map((noteItem) {
      /// modify each item in the list
      /// and return the modified values in a brand new
      final convertedNote = Note.convertMapToNote(noteItem);
      return convertedNote;
    }).toList();

    return tempNotesList;
  }
}

someFunction() {
  final instance = DBService.instance;
}
