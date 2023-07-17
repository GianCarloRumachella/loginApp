import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';

import 'package:login_app/modules/core/ui/widgets/app_password_textfield_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_textfield_widget.dart';
import 'package:login_app/modules/core/validators/validator.dart';
import 'package:login_app/modules/login/presentation/controllers/login_controller.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  late final LoginController _controller;

  @override
  void initState() {
    _controller = Modular.get<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _controller.validateForm();
      },
      hasAppBar: false,
      body: Form(
        key: _controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Bem vindo!',
                style: AppTypography.titleSmall,
              ),
            ),
            const SizedBox(height: 64),
            AppTextFieldWidget(
              keyboardType: TextInputType.emailAddress,
              label: 'email',
              controller: _controller.emailController,
              validator: (value) {
                return Validator.isValidEmail(value: value);
              },
              onFieldSubmitted: (value) {
                _controller.validateForm();
              },
              onChanged: (value) => _controller.validateForm(),
            ),
            const SizedBox(height: 16),
            AppPasswordTextfieldWidget(
              controller: _controller.passwordController,
              validator: (value) {
                return Validator.isEmpty(value ?? '');
              },
              onFieldSubmitted: (value) {
                _controller.validateForm();
              },
              onChanged: (value) {
                _controller.validateForm();
              },
            ),
            const SizedBox(height: 32),
            ValueListenableBuilder(
              valueListenable: _controller.enableButton,
              builder: (context, value, child) => AppButtonWidget(
                onPressed: value
                    ? () {
                        _controller.authUser(context);
                      }
                    : null,
                label: 'Entrar',
              ),
            ),
            const SizedBox(height: 54),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ainda não tem conta?',
                  style: AppTypography.textMedium,
                ),
                const SizedBox(width: 10),
                TextButton(
                    onPressed: () {
                      _controller.createAccount();
                    },
                    child: Text(
                      'Crie sua conta',
                      style: AppTypography.textMedium,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
