import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/app_typography.dart';

class AppTextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final bool enable;

  const AppTextFieldWidget({
    super.key,
    this.label = '',
    required this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    required this.validator,
    this.keyboardType = TextInputType.name,
    this.inputFormatter,
    this.enable = true,
  });

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enable,
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0),
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
