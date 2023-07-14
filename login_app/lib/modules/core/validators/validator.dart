class Validator {
  static String? isValidEmail({String? value}) {
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value ?? '')) {
      return 'Insira um email válido.';
    }
    return null;
  }

  static String? isEmpty({String? value}) {
    if (value == null || value.isEmpty) {
      return 'Esse campo não pode ser vazio';
    }
    return null;
  }
}
