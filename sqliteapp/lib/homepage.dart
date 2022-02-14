import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Database ourDatabase;

  @override
  void initState() {
    super.initState();
    checkPathsAndPrint();
    initAndOpenDatabase();
  }

  checkPathsAndPrint() async {
    final docsDir = await getApplicationDocumentsDirectory();

    if (kDebugMode == true) {
      print(docsDir.path);
    }
  }

  static const USER_ID = 'id';
  static const User_Table = "users";
  initAndOpenDatabase() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final databseName = "our_test_database.db";
// /data/users/0/com.something/app/our_test_databse.db

    final databsePath = "${docsDir.path}/$databseName";
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
        Description TEXT
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
      print(e);
    }
  }

  getUsers() async {
    try {
      await ourDatabase.query(User_Table);

      final data = await ourDatabase.rawQuery('''SELECT * FROM $User_Table ''');
      print(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  ))
            ]),
      ),
    );
  }
}
