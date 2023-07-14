import 'package:flutter/material.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      hasAppBar: false,
      body: Column(
        children: [
          Center(
            child: Text(
              'Olá Fulano!',
              style: AppTypography.titleBig,
            ),
          ),
          Center(
            child: Text(
              'Olá Fulano!',
              style: AppTypography.titleMedium,
            ),
          ),
          Center(
            child: Text(
              'Olá Fulano!',
              style: AppTypography.titleSmall,
            ),
          ),
          Center(
            child: Text(
              'Olá Fulano!',
              style: AppTypography.textBig,
            ),
          ),
          Center(
            child: Text(
              'Olá Fulano!',
              style: AppTypography.textMedium,
            ),
          ),
          Center(
            child: Text(
              'Olá Fulano!',
              style: AppTypography.textSmall,
            ),
          ),
          Center(
            child: Text(
              'Olá Fulano!',
              style: AppTypography.overline,
            ),
          ),
        ],
      ),
    );
  }
}
