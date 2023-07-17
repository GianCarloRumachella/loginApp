import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/core/ui/widgets/app_alerts.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';

class ConfigurationHomePage extends StatelessWidget {
  const ConfigurationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Área do usuário',
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).height / 3),
        child: InkWell(
          onTap: () {
            Modular.to.pushNamed(AppRoutes.password);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.password_sharp,
                color: Colors.blueGrey,
              ),
              Text(
                'Trocar senha',
                style: AppTypography.textBig,
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
      bottom: InkWell(
        onTap: () {
          AppAlerts().alert(context: context, message: 'xalala');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.logout_sharp,
              color: Colors.blueGrey,
            ),
            Text(
              'Sair do app',
              style: AppTypography.textBig,
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
