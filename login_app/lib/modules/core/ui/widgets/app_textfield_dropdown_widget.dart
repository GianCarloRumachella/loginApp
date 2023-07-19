import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldDropdownWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatter;

  const AppTextFieldDropdownWidget({
    super.key,
    this.label = '',
    required this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    required this.validator,
    this.keyboardType = TextInputType.name,
    this.inputFormatter,
  });

  @override
  State<AppTextFieldDropdownWidget> createState() => _AppTextFieldDropdownWidgetState();
}

class _AppTextFieldDropdownWidgetState extends State<AppTextFieldDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      enabled: false,
      inputFormatters: widget.inputFormatter,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        errorStyle: const TextStyle(height: 0),
        suffixIcon: const Icon(Icons.arrow_drop_down),
        hintText: widget.label,
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
