class FormValidator {
  static String? title(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Title cannot be empty';
    }

    return null;
  }

  static String? address(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Address cannot be empty';
    }

    return null;
  }
}
