import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/controllers/new_password_controller.dart';
import 'package:login_app/modules/core/ui/widgets/app_password_errors_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_password_textfield_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';
import 'package:login_app/modules/core/validators/validator.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  late final NewPasswordController _controller;

  @override
  void initState() {
    _controller = Modular.get<NewPasswordController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Trocar senha',
      body: Column(
        children: [
          Text(
            'Insira sua nova senha',
            style: AppTypography.titleSmall,
          ),
          const SizedBox(height: 36),
          AppPasswordTextfieldWidget(
            controller: _controller.passwordController,
            validator: (value) {
              if (value == null) return null;

              for (final validator in _controller.errors.value) {
                final error = validator.error(value);
                if (error != null) {
                  validator.isValid = false;
                  setState(() {});
                  return error;
                }
                validator.isValid = true;
                setState(() {});
              }
              return null;
            },
            onChanged: (value) {
              _controller.password = value;
              _controller.validateForm();
              _controller.isPasswordValid(value);
            },
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder(
            valueListenable: _controller.errors,
            builder: (context, value, child) => AppPasswordErrorsWidget(errors: value),
          ),
          const SizedBox(height: 16),
          AppPasswordTextfieldWidget(
            controller: _controller.confirmPasswordController,
            validator: (value) {
              if (value == null) return null;
              return Validator.isEqual(value, _controller.passwordController.text);
            },
            onChanged: (value) {
              _controller.validateForm();
            },
          ),
        ],
      ),
    );
  }
}
