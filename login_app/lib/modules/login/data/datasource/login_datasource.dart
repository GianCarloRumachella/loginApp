import 'package:login_app/modules/login/data/models/login_model.dart';

abstract class LoginDatasource {
  Future<bool> authUser(LoginModel loginModel);
}
