import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/login/data/models/login_model.dart';

abstract class LoginDatasource {
  Future<UserModel> authUser(LoginModel loginModel);
}
