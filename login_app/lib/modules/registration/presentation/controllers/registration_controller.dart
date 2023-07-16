// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:login_app/modules/core/domain/entities/error_entity.dart';
import 'package:login_app/modules/core/validators/validator.dart';
import 'package:login_app/modules/registration/data/models/registration_model.dart';
import 'package:login_app/modules/registration/domain/usecases/create_user_usecase.dart';

typedef PasswordValidator = String? Function(String value);

class RegistrationController {
  final CreateUserUsecase _createUserUsecase;

  RegistrationController({
    required CreateUserUsecase createUserUsecase,
  }) : _createUserUsecase = createUserUsecase;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ValueNotifier<List<ErrorEntity>> errors = ValueNotifier([]);
  ValueNotifier<bool> enableButton = ValueNotifier(false);
  String password = '';

  void init() {
    errors.value = [
      ErrorEntity(error: Validator.isEmpty, isValid: false, message: 'Não pode ser vazia'),
      ErrorEntity(error: Validator.containsLowerCaseLetter, isValid: false, message: 'Deve conter uma letra minúscula'),
      ErrorEntity(error: Validator.containsNumber, isValid: false, message: 'Deve conter um número'),
      ErrorEntity(error: Validator.containsUpperCaseLetter, isValid: false, message: 'Deve conter uma letra maiúscula'),
      ErrorEntity(error: Validator.containsSpecialCharacter, isValid: false, message: 'Deve conter um caracter especial'),
      ErrorEntity(error: Validator.hasMinimumLength, isValid: false, message: 'deve conter no mínimo 8 caracteres'),
    ];
  }

  validateForm() {
    if (formKey.currentState?.validate() == true) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }

  isPasswordValid(String password) {
    for (final validator in errors.value) {
      final error = validator.error(password);
      if (error != null) {
        return error;
      }
    }
    return null;
  }

  createUser() async {
    var response = await _createUserUsecase.call(
      RegistrationModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold((l) {
      print("erro do fold ${l.message}");
    }, (r) {
      print("sucesso do fold $r");
      Modular.to.pop();
    });
  }
}
