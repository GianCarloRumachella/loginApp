import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/app_typography.dart';
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
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Trocar senha',
      body: Column(
        children: [
          Text(
            'Insira sua senha atual',
            style: AppTypography.titleSmall,
          ),
          const SizedBox(height: 36),
          AppPasswordTextfieldWidget(
            controller: TextEditingController(),
            validator: (value) {
              return Validator.isEmpty(value ?? '');
            },
          ),
        ],
      ),
      bottom: AppButtonWidget(
          onPressed: () {
            Modular.to.pushNamed(AppRoutes.newPassword);
          },
          label: 'Próximo'),
    );
  }
}
