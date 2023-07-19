import 'package:flutter/material.dart';
import 'package:login_app/app_typography.dart';

class AppPasswordTextfieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  const AppPasswordTextfieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  State<AppPasswordTextfieldWidget> createState() => _AppPasswordTextfieldWidgetState();
}

class _AppPasswordTextfieldWidgetState extends State<AppPasswordTextfieldWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      obscureText: _obscureText,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        label: Text(
          'Senha',
          style: AppTypography.overline.copyWith(fontSize: 16),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            size: 16,
          ),
        ),
      ),
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
