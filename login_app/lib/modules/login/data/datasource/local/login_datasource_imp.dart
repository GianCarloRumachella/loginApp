import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/db/db_helper.dart';
import 'package:login_app/modules/core/failures/failure.dart';
import 'package:login_app/modules/login/data/datasource/login_datasource.dart';
import 'package:login_app/modules/login/data/models/login_model.dart';

class LoginDatasourceImp implements LoginDatasource {
  final _db = DBHelper();

  @override
  Future<UserModel> authUser(LoginModel loginModel) async {
    var response = await _db.authUser(loginModel);
    if (response.id != 0) {
      if (response.password == loginModel.password) {
        return response;
      } else {
        throw Failure('senha incorreta');
      }
    } else {
      throw Failure('usuario não cadastrado');
    }
  }
}
