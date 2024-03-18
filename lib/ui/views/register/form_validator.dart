import 'package:password_policy/password_policy.dart';

const String _emailRegex =
    r"""^[\w!#$%&\'*+/=?^_`{|}~-]+(?:\.[\w!#$%&\'*+/=?^_`{|}~-]+)*@(?:[\w-]+\.)+[\w]{2,}$""";

PasswordPolicy passwordPolicy = PasswordPolicy(
  minimumScore: 0.8,
  validationRules: [
    LengthRule(
        minimalLength: 8, name: 'Password should be at least 8 characters'),
    UpperCaseRule(name: 'Password should contain one upper case character'),
    LowerCaseRule(name: 'Password should contain one lower case character'),
    DigitRule(name: 'Password should contain one digit'),
    NoSpaceRule(name: 'Password should not contain spaces'),
    SpecialCharacterRule(isMandatory: false, name: null),
  ],
);

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

  static String? name(String? input) {
    if (input == null || input.isEmpty) {
      return 'Name cannot be empty';
    }

    return null;
  }

  static String? password(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    final passwordCheck = PasswordCheck(
      password: input,
      passwordPolicy: passwordPolicy,
    );

    if (!passwordCheck.isValid) {
      return passwordCheck.notRespectedMandatoryRules
          .map<String?>((rule) => rule.name)
          .join('\n');
    }

    return null;
  }

}
