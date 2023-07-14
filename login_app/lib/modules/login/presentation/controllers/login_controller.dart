import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ValueNotifier<bool> enableButton = ValueNotifier<bool>(false);

  validateForm() {
    if (formKey.currentState?.validate() == true) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
  }
}
