import 'package:flutter/material.dart';
import 'package:login_app/app_typography.dart';

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
}
