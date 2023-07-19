import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/configurations/presentation/controllers/configuration_controller.dart';

import 'package:login_app/modules/core/ui/widgets/app_alerts.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';
import 'package:login_app/modules/core/ui/widgets/app_scaffold_widget.dart';

class ConfigurationHomePage extends StatelessWidget {
  ConfigurationHomePage({super.key});

  final ConfigurationController _controller = Modular.get<ConfigurationController>();

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Área do usuário',
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Modular.to.pushNamed(AppRoutes.password);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.password_sharp,
                  color: Colors.blueGrey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Trocar senha',
                    style: AppTypography.textBig.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              AppAlerts().alert(
                context: context,
                title: '',
                message: 'Deseja sair do app?',
                buttons: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: AppButtonWidget(
                        onPressed: () async {
                          _controller.logout();
                        },
                        label: 'Sim',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: AppButtonWidget(
                        type: ButtonType.text,
                        onPressed: () {
                          Modular.to.pop();
                        },
                        label: 'Não',
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.logout_sharp,
                  color: Colors.blueGrey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Sair do app',
                    style: AppTypography.textBig.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
