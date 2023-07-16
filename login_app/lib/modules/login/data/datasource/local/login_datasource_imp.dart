import 'package:login_app/modules/core/db/db_helper.dart';
import 'package:login_app/modules/login/data/datasource/login_datasource.dart';
import 'package:login_app/modules/login/data/models/login_model.dart';

class LoginDatasourceImp implements LoginDatasource {
  final _db = DBHelper();

  @override
  Future<bool> authUser(LoginModel loginModel) async {
    var response = await _db.authUser(loginModel);

    if (response.password == loginModel.password) {
      return true;
    } else {
      return false;
    }
  }
}
