import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();

    return _database!;
  }

  static _initDatabase() async {
    try {
      String path = join(
        await getDatabasesPath(),
        "users_database.db",
      );
      await deleteDatabase(path);
      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
        onConfigure: _onconfigure,
      );
    } catch (error) {
      print(error);
    }
  }

  static Future _onconfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
    print('Foreign keys turned on');
  }

  static Future _onCreate(Database db, int version) async {
    var sql = [
      "CREATE TABLE USER (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(150), email VARCHAR(150), password VARCHAR(20))",
      "CREATE TABLE ENDERECO(id INTEGER PRIMARY KEY AUTOINCREMENT, zipcode VARCHAR(10), street VARCHAR(50), number VARCHAR(10), complement VARCHAR(50), neighbourhood VARCHAR(50), state VARCHAR(2), id_user INT, FOREIGN KEY(id_user) REFERENCES USER(id))",
    ];

    for (int i = 0; i < sql.length; i++) {
      print("execute sql : ${sql[i]}");
      await db.execute(sql[i]).catchError((onError) => print(onError));
    }
  }
}
