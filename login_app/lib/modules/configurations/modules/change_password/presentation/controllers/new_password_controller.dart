import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/modules/configurations/modules/change_password/domain/usecases/update_password.dart';
import 'package:login_app/modules/core/data/models/user_model.dart';
import 'package:login_app/modules/core/domain/entities/error_entity.dart';
import 'package:login_app/modules/core/secure_storage/secure_storage.dart';
import 'package:login_app/modules/core/ui/widgets/app_alerts.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';
import 'package:login_app/modules/core/validators/validator.dart';

typedef PasswordValidator = String? Function(String value);

class NewPasswordController {
  final UpdatePassword _updatePassword;

  NewPasswordController({required UpdatePassword updatePassword}) : _updatePassword = updatePassword;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ValueNotifier<List<ErrorEntity>> errors = ValueNotifier([]);
  ValueNotifier<bool> enableButton = ValueNotifier(false);
  String password = '';

  void init() {
    errors.value = [
      ErrorEntity(error: Validator.containsLowerCaseLetter, isValid: false, message: 'Deve conter uma letra minúscula'),
      ErrorEntity(error: Validator.containsNumber, isValid: false, message: 'Deve conter um número'),
      ErrorEntity(error: Validator.containsUpperCaseLetter, isValid: false, message: 'Deve conter uma letra maiúscula'),
      ErrorEntity(error: Validator.containsSpecialCharacter, isValid: false, message: 'Deve conter um caracter especial'),
      ErrorEntity(error: Validator.hasMinimumLength, isValid: false, message: 'Deve conter no mínimo 8 caracteres'),
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

  Future<void> updatePassword(BuildContext context) async {
    UserModel tempUser = await SecureStorage().getSession();

    final response = await _updatePassword.call(
      UserModel(
        id: tempUser.id,
        name: tempUser.name,
        email: tempUser.email,
        password: passwordController.text,
      ),
    );

    response.fold((l) {
      AppAlerts().snackBar(context: context, message: 'Erro ao salvar a nova senha! Tente novamente.');
    }, (r) {
      AppAlerts().alert(
        context: context,
        title: 'Sucesso!',
        message: 'Sua senha foi alterada. Faça o login com sua nova senha.',
        buttons: AppButtonWidget(
            onPressed: () async {
              await SecureStorage().deleteSession();
              Modular.to.popUntil(ModalRoute.withName(AppRoutes.initialRoute));
            },
            label: 'Fazer Login'),
      );
    });
  }
}
