// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rescue_me/ui/views/add_emergency_contact/form_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';
const String EmailValueKey = 'email';
const String PhoneValueKey = 'phone';
const String TypeValueKey = 'type';
const String ImageUrlValueKey = 'imageUrl';

final Map<String, String> TypeValueToTitleMap = {
  'Police': 'Police',
  'Ambulance': 'Ambulance',
  'Fire': 'Fire',
  'Personal': 'Personal',
};

final Map<String, TextEditingController>
    _AddEmergencyContactViewTextEditingControllers = {};

final Map<String, FocusNode> _AddEmergencyContactViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AddEmergencyContactViewTextValidations = {
  NameValueKey: FormValidator.name,
  EmailValueKey: FormValidator.email,
  PhoneValueKey: FormValidator.phone,
  ImageUrlValueKey: null,
};

mixin $AddEmergencyContactView {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get phoneController =>
      _getFormTextEditingController(PhoneValueKey);
  TextEditingController get imageUrlController =>
      _getFormTextEditingController(ImageUrlValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get phoneFocusNode => _getFormFocusNode(PhoneValueKey);
  FocusNode get imageUrlFocusNode => _getFormFocusNode(ImageUrlValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddEmergencyContactViewTextEditingControllers.containsKey(key)) {
      return _AddEmergencyContactViewTextEditingControllers[key]!;
    }

    _AddEmergencyContactViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddEmergencyContactViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddEmergencyContactViewFocusNodes.containsKey(key)) {
      return _AddEmergencyContactViewFocusNodes[key]!;
    }
    _AddEmergencyContactViewFocusNodes[key] = FocusNode();
    return _AddEmergencyContactViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    imageUrlController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    imageUrlController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          EmailValueKey: emailController.text,
          PhoneValueKey: phoneController.text,
          ImageUrlValueKey: imageUrlController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _AddEmergencyContactViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddEmergencyContactViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddEmergencyContactViewTextEditingControllers.clear();
    _AddEmergencyContactViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get phoneValue => this.formValueMap[PhoneValueKey] as String?;
  String? get typeValue => this.formValueMap[TypeValueKey] as String?;
  String? get imageUrlValue => this.formValueMap[ImageUrlValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_AddEmergencyContactViewTextEditingControllers.containsKey(
        NameValueKey)) {
      _AddEmergencyContactViewTextEditingControllers[NameValueKey]?.text =
          value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_AddEmergencyContactViewTextEditingControllers.containsKey(
        EmailValueKey)) {
      _AddEmergencyContactViewTextEditingControllers[EmailValueKey]?.text =
          value ?? '';
    }
  }

  set phoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneValueKey: value}),
    );

    if (_AddEmergencyContactViewTextEditingControllers.containsKey(
        PhoneValueKey)) {
      _AddEmergencyContactViewTextEditingControllers[PhoneValueKey]?.text =
          value ?? '';
    }
  }

  set imageUrlValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ImageUrlValueKey: value}),
    );

    if (_AddEmergencyContactViewTextEditingControllers.containsKey(
        ImageUrlValueKey)) {
      _AddEmergencyContactViewTextEditingControllers[ImageUrlValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasPhone =>
      this.formValueMap.containsKey(PhoneValueKey) &&
      (phoneValue?.isNotEmpty ?? false);
  bool get hasType => this.formValueMap.containsKey(TypeValueKey);
  bool get hasImageUrl =>
      this.formValueMap.containsKey(ImageUrlValueKey) &&
      (imageUrlValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey]?.isNotEmpty ?? false;
  bool get hasTypeValidationMessage =>
      this.fieldsValidationMessages[TypeValueKey]?.isNotEmpty ?? false;
  bool get hasImageUrlValidationMessage =>
      this.fieldsValidationMessages[ImageUrlValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get phoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey];
  String? get typeValidationMessage =>
      this.fieldsValidationMessages[TypeValueKey];
  String? get imageUrlValidationMessage =>
      this.fieldsValidationMessages[ImageUrlValueKey];
}

extension Methods on FormStateHelper {
  void setType(String type) {
    this.setData(
      this.formValueMap..addAll({TypeValueKey: type}),
    );

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneValueKey] = validationMessage;
  setTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TypeValueKey] = validationMessage;
  setImageUrlValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ImageUrlValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    emailValue = '';
    phoneValue = '';
    imageUrlValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      ImageUrlValueKey: getValidationMessage(ImageUrlValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddEmergencyContactViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddEmergencyContactViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      ImageUrlValueKey: getValidationMessage(ImageUrlValueKey),
    });
