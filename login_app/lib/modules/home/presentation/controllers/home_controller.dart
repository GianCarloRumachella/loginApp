import 'package:flutter/material.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/domain/entities/user_entity.dart';
import 'package:login_app/modules/core/secure_storage/secure_storage.dart';

class HomeController extends ChangeNotifier {
  ValueNotifier<UserEntity> user = ValueNotifier(UserModel.empty());

  void init(BuildContext context) async {
    user.value = await SecureStorage().getSession();
    notifyListeners();
  }
}
