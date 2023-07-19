import 'package:login_app/modules/core/data/models/user_model.dart';

abstract class ChangePasswordDatasource {
  Future<int> updatePassword(UserModel user);
}
