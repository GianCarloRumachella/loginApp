import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/configurations/modules/change_password/presentation/controllers/change_password_controller.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_password_textfield_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';
import 'package:login_app/modules/core/validators/validator.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late final ChangePasswordController _controller;

  @override
  void initState() {
    _controller = Modular.get<ChangePasswordController>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _controller.validateForm();
      },
      title: 'Trocar senha',
      body: Form(
        key: _controller.formKey,
        child: Column(
          children: [
            Text(
              'Insira sua senha atual',
              style: AppTypography.titleSmall.copyWith(fontSize: 30),
            ),
            const SizedBox(height: 36),
            AppPasswordTextfieldWidget(
              controller: _controller.passwordController,
              validator: (value) {
                return Validator.isEmpty(value ?? '');
              },
              onFieldSubmitted: (value) {
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
                  _controller.checkPassword(context);
                }
              : null,
          label: 'Próximo',
        ),
      ),
    );
  }
}
