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

  alert({
    required BuildContext context,
    required String title,
    required String message,
    required Widget buttons,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Center(
            child: Text(
              title,
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
                  message,
                  style: AppTypography.textBig,
                ),
              ),
            ],
          ),
          actions: [buttons],
        );
      },
    );
  }
}
