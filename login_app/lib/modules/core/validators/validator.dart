class Validator {
  static String? isValidEmail({String? value}) {
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value ?? '')) {
      return 'Insira um email válido.';
    }
    return null;
  }

  static String? isEmpty(String value) {
    if (value.isEmpty) {
      return '';
    }
    return null;
  }

  static String? hasMinimumLength(String value) {
    if (value.length < 8) {
      //return 'A senha deve ter no mínimo 8 caracteres.';
      return '';
    }
    return null;
  }

  static String? containsUpperCaseLetter(String value) {
    if (!value.contains(RegExp(r'[A-Z]'))) {
      // return 'A senha deve conter pelo menos uma letra maiúscula.';
      return '';
    }

    return null;
  }

  static String? containsLowerCaseLetter(String value) {
    if (!value.contains(RegExp(r'[a-z]'))) {
      //return 'A senha deve conter pelo menos uma letra minúscula.';
      return '';
    }

    return null;
  }

  static String? containsNumber(String value) {
    if (!value.contains(RegExp(r'[0-9]'))) {
      //return 'A senha deve conter pelo menos um número';
      return '';
    }

    return null;
  }

  static String? containsSpecialCharacter(String value) {
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      //return 'A senha deve conter pelo menos um caracter especial';
      return '';
    }

    return null;
  }

  static String? isEqual(String value, String valurToCompare) {
    if (valurToCompare.compareTo(value) != 0) {
      return 'A senha não é igual.';
    }
    return null;
  }
}
