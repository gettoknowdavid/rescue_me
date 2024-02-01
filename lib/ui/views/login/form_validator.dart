const String _emailRegex =
    r"""^[\w!#$%&\'*+/=?^_`{|}~-]+(?:\.[\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\w-]+\.)+[\w]{2,}$""";

class FormValidator {
  static String? email(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Email cannot be empty';
    }

    if (RegExp(_emailRegex).hasMatch(input)) {
      return null;
    }

    return 'Please provide a valid email';
  }

  static String? password(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    return null;
  }
}
