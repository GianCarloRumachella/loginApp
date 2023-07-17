import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_app/app_routes.dart';
import 'package:login_app/app_typography.dart';
import 'package:login_app/modules/core/ui/widgets/app_button_widget.dart';

class AppAlerts {
  snackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTypography.overline.copyWith(color: Colors.white, fontSize: 14),
        ),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  alert({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Sair do app',
              style: AppTypography.textBig.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Deseja sair do app?',
                  style: AppTypography.textBig,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppButtonWidget(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  label: 'Não',
                  type: ButtonType.text,
                ),
                AppButtonWidget(
                  onPressed: () {
                    Modular.to.popUntil(ModalRoute.withName(AppRoutes.initialRoute));
                  },
                  label: 'Sim',
                  type: ButtonType.text,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
