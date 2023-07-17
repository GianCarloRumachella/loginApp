import 'package:flutter/material.dart';

class ChangePasswordController {
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> enableButton = ValueNotifier(false);

  validateForm() {
    if (formKey.currentState?.validate() == true) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }
}
