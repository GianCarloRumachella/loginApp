import 'package:flutter/material.dart';
import 'package:login_app/app_typography.dart';

class AppTextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?) validator;

  const AppTextFieldWidget({
    super.key,
    this.label = '',
    required this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    required this.validator,
  });

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: AppTypography.overline.copyWith(fontSize: 16),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
