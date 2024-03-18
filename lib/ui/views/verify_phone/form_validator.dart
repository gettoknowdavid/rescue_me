class FormValidator {
  static String? phone(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Phone Number cannot be empty';
    }

    return null;
  }

  static String? code(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'SMS Code cannot be empty';
    }

    if (input.length != 6) {
      return 'Please put in a valid code';
    }

    return null;
  }
}
