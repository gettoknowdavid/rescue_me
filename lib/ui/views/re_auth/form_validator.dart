class FormValidator {
  static String? password(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    return null;
  }
}
