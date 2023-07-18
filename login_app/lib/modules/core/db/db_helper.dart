/* import 'package:sqflite/sqflite.dart';
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
        //onConfigure: _onconfigure,
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
      "CREATE TABLE IF NOT EXISTS USER (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(150), email VARCHAR(150), password VARCHAR(20))",
      "CREATE TABLE IF NOT EXISTS ENDERECO(id INTEGER PRIMARY KEY AUTOINCREMENT, zipcode VARCHAR(10), street VARCHAR(50), number VARCHAR(10), complement VARCHAR(50), neighbourhood VARCHAR(50), state VARCHAR(2), id_user INT, FOREIGN KEY(id_user) REFERENCES USER(id))",
    ];

    for (int i = 0; i < sql.length; i++) {
      print("execute sql : ${sql[i]}");
      await db.execute(sql[i]).catchError((onError) => print(onError));
    }
  }
}
 */

import 'package:login_app/modules/address/data/models/address_model.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/login/data/models/login_model.dart';
import 'package:login_app/modules/registration/data/models/registration_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const String userTable = "user";
  static const String addressTable = "address";

  // padrão singleton
  static final DBHelper _dbHelper = DBHelper._internal();

  Database? _db;

  factory DBHelper() {
    return _dbHelper;
  }

  DBHelper._internal();

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async {
    String user = "CREATE TABLE $userTable ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(150), email VARCHAR(150), password VARCHAR(20))";
    String address = "CREATE TABLE $addressTable ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, zipcode VARCHAR(10), street VARCHAR(50), number VARCHAR(10), complement VARCHAR(50), neighborhood VARCHAR(50), city VARCHAR(50), state VARCHAR(2), id_user INT, FOREIGN KEY(id_user) REFERENCES USER(id))";

    await db.execute(user);
    await db.execute(address);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco_divide_lista.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  /*  Future<int> salvarItem(Item item) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(tabelaItens, item.toMap());

    return resultado;
  }

  recuperarItens() async {
    var bancoDados = await db;

    String sql = "SELECT * FROM $tabelaItens ORDER BY nome ASC";
    List itens = await bancoDados.rawQuery(sql);

    return itens;
  }

  Future<int> removerItens(int id) async {
    var bancoDados = await db;

    return await bancoDados.delete(tabelaItens, where: "id = ?", whereArgs: [id]);
  }

  Future<int> atualizarItens(Item item) async {
    var bancoDados = await db;
    return await bancoDados.update(tabelaItens, item.toMap(), where: "id = ?", whereArgs: [item.id]);
  } */

  Future<int> createUser(RegistrationModel registrationModel) async {
    var database = await db;
    int resultado = await database.insert(userTable, registrationModel.toMap());

    return resultado;
  }

  Future<UserModel> authUser(LoginModel loginModel) async {
    var database = await db;

    final response = await database.query(
      userTable,
      columns: ["id", "name", "email", "password"],
      where: 'email = ?',
      whereArgs: [loginModel.email],
    );

    late UserModel user;
    if (response.isEmpty) {
      user = UserModel.empty();
    } else {
      user = UserModel(
        id: response[0]['id'],
        name: response[0]['name'],
        email: response[0]['email'],
        password: response[0]['password'],
      );
    }

    return user;
  }

  Future<int> updatePassword(UserModel user) async {
    var database = await db;

    final response = await database.rawUpdate(
      "UPDATE $userTable SET password = ? WHERE id = ? ",
      [
        user.password,
        user.id,
      ],
    );

    return response;
  }

  Future<int> saveAddress(AddressModel address) async {
    var database = await db;
    int resultado = await database.insert(addressTable, address.toMap());

    return resultado;
  }
  /* recuperarPessoas(bool ascOrder) async {
    var bancoDados = await db;

    if (ascOrder) {
      String sql = "SELECT * FROM $tabelaPessoas ORDER BY nome ASC";
      List pessoas = await bancoDados.rawQuery(sql);

      return pessoas;
    } else {
      String sql = "SELECT * FROM $tabelaPessoas ORDER BY telefone ASC";
      List pessoas = await bancoDados.rawQuery(sql);

      return pessoas;
    }
  }

  Future<int> removerPessoas(int id) async {
    var bancoDados = await db;

    return await bancoDados.delete(tabelaPessoas, where: "id = ?", whereArgs: [id]);
  }

  Future<int> atualizarPessoas(Pessoa pessoa) async {
    var bancoDados = await db;
    return await bancoDados.update(tabelaPessoas, pessoa.toMap(), where: "id = ?", whereArgs: [pessoa.id]);
  }

  Future<int> removerPessoaItens() async {
    var bancoDados = await db;
    return await bancoDados.delete(tabelaPessoasItens);
  }

  Future<int> salvarPessoaItens(PessoaItem pessoaItem) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(tabelaPessoasItens, pessoaItem.toMap());

    return resultado;
  }

  Future<int> atualizarPessoasItens(PessoaItem pessoaItem) async {
    var bancoDados = await db;

    return await bancoDados.update(tabelaPessoasItens, pessoaItem.toMap(), where: "id = ?", whererArgs: [pessoaItem.id]);
  }

  recuperarPessoasItens() async {
    var bancoDados = await db;

    String sql = "SELECT * FROM $tabelaPessoasItens ORDER BY nome ASC";
    List pessoasItens = await bancoDados.rawQuery(sql);

    return pessoasItens;
  } */
}
