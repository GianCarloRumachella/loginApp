import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/login/data/models/login_model.dart';
import 'package:login_app/modules/login/domain/usecases/auth_user_usecase.dart';

class LoginController {
  final AuthUserUsecase _authUserUsecase;

  LoginController({required AuthUserUsecase authUserUsecase}) : _authUserUsecase = authUserUsecase;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ValueNotifier<bool> enableButton = ValueNotifier<bool>(false);

  validateForm() {
    if (formKey.currentState?.validate() == true) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }

  void createAccount() {
    Modular.to.pushNamed(AppRoutes.registration);
  }

  void authUser() async {
    var response = await _authUserUsecase.call(LoginModel(email: emailController.text, password: passwordController.text));

    response.fold((l) {
      print('erro no fold ${l.message}');
    }, (r) {
      print('sucesso no fold $r');
    });
  }
}
