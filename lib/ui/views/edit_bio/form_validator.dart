class FormValidator {
  static String? name(String? input) {
    if (input == null || input.isEmpty) {
      return 'Name cannot be empty';
    }

    return null;
  }
}
