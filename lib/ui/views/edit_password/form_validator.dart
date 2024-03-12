import 'package:password_policy/password_policy.dart';

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
  static String? oldPassword(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    return null;
  }

  static String? newPassword(String? input) {
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
