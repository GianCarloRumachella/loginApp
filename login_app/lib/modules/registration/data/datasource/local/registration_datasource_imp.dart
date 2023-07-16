import 'package:login_app/modules/core/db/db_helper.dart';
import 'package:login_app/modules/registration/data/datasource/registration_datasource.dart';
import 'package:login_app/modules/registration/data/models/registration_model.dart';
import 'package:sqflite/sqflite.dart';

class RegistrationDatasourceImp implements ResgistrationDatasource {
  static const _table = 'USER';

  Future<Database> _database() {
    return DBHelper.instance.database;
  }

  @override
  Future<int> createUser(RegistrationModel registrationModel) async {
    final Database db = await _database();

    return await db.insert(_table, registrationModel.toMap());
  }
}
