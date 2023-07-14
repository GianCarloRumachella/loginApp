// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_app/app_typography.dart';

class AppButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String label;

  const AppButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  State<AppButtonWidget> createState() => _AppButtonWidgetState();
}

class _AppButtonWidgetState extends State<AppButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.75, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.label,
        style: AppTypography.textMedium.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
