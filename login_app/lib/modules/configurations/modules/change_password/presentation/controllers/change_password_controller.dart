import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/secure_storage/secure_storage.dart';
import 'package:login_app/modules/core/ui/widgets/app_alerts.dart';

class ChangePasswordController {
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> enableButton = ValueNotifier(false);

  late final UserModel sessionModel;

  Future<void> init() async {
    sessionModel = await SecureStorage().getSession();
  }

  validateForm() {
    if (formKey.currentState?.validate() == true) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }

  checkPassword(BuildContext context) {
    if (sessionModel.password?.compareTo(passwordController.text) == 0) {
      Modular.to.pushNamed(AppRoutes.newPassword);
    } else {
      AppAlerts().snackBar(context: context, message: 'Senha incorreta.');
    }
  }
}
