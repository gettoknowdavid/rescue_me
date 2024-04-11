const String _emailRegex =
    r"""^[\w!#$%&\'*+/=?^_`{|}~-]+(?:\.[\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\w-]+\.)+[\w]{2,}$""";

class FormValidator {
  static String? email(String? input) {
    if (input == null || input.isEmpty == true) {
      return null;
    }

    if (RegExp(_emailRegex).hasMatch(input)) {
      return null;
    }

    return 'Please provide a valid email';
  }

  static String? name(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Name cannot be empty';
    }

    return null;
  }

  static String? phone(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Phone Number cannot be empty';
    }

    return null;
  }
}
