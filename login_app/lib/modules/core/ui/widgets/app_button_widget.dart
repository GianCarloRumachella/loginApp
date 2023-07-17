// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_app/app_typography.dart';

enum ButtonType { text, green }

class AppButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String label;
  final ButtonType type;

  const AppButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
    this.type = ButtonType.green,
  });

  @override
  State<AppButtonWidget> createState() => _AppButtonWidgetState();
}

class _AppButtonWidgetState extends State<AppButtonWidget> {
  ButtonStyle get style {
    switch (widget.type) {
      case ButtonType.green:
        return ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width * 0.75, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: Colors.greenAccent,
          elevation: 0,
        );
      case ButtonType.text:
        return ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.grey[100],
            foregroundColor: Colors.transparent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: widget.onPressed,
      child: Text(
        widget.label,
        style: AppTypography.textMedium.copyWith(
          color: widget.type == ButtonType.text ? Colors.blueGrey : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
