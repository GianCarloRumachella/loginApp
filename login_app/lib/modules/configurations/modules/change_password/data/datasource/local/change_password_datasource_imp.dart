import 'package:login_app/modules/configurations/modules/change_password/data/datasource/change_password_datasource.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/db/db_helper.dart';

class ChangePasswordDatasourceImp implements ChangePasswordDatasource {
  final DBHelper _db = DBHelper();

  @override
  Future<int> updatePassword(UserModel user) async {
    return await _db.updatePassword(user);
  }
}
