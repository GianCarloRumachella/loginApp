import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_password_errors_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_password_textfield_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_textfield_widget.dart';
import 'package:login_app/modules/core/validators/validator.dart';
import 'package:login_app/modules/registration/presentation/controllers/registration_controller.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final RegistrationController _controller;

  @override
  void initState() {
    _controller = Modular.get<RegistrationController>()..init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _controller.validateForm();
      },
      title: 'Crie sua conta',
      body: Form(
        key: _controller.formKey,
        child: Column(
          children: [
            AppTextFieldWidget(
              label: 'Nome Completo',
              controller: _controller.nameController,
              validator: (value) {
                return Validator.isEmpty(value ?? '');
              },
            ),
            const SizedBox(height: 16),
            AppTextFieldWidget(
              keyboardType: TextInputType.emailAddress,
              label: 'E-mail',
              controller: _controller.emailController,
              validator: (value) {
                return Validator.isValidEmail(value: value);
              },
            ),
            const SizedBox(height: 16),
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
      ),
      bottom: ValueListenableBuilder(
        valueListenable: _controller.enableButton,
        builder: (context, value, child) => AppButtonWidget(
          onPressed: value
              ? () {
                  _controller.createUser(context);
                }
              : null,
          label: 'Criar',
        ),
      ),
    );
  }
}
