// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rescue_me/ui/views/update_phone/form_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PhoneValueKey = 'phone';
const String CodeValueKey = 'code';

final Map<String, TextEditingController>
    _UpdatePhoneViewTextEditingControllers = {};

final Map<String, FocusNode> _UpdatePhoneViewFocusNodes = {};

final Map<String, String? Function(String?)?> _UpdatePhoneViewTextValidations =
    {
  PhoneValueKey: FormValidator.phone,
  CodeValueKey: FormValidator.code,
};

mixin $UpdatePhoneView {
  TextEditingController get phoneController =>
      _getFormTextEditingController(PhoneValueKey);
  TextEditingController get codeController =>
      _getFormTextEditingController(CodeValueKey);

  FocusNode get phoneFocusNode => _getFormFocusNode(PhoneValueKey);
  FocusNode get codeFocusNode => _getFormFocusNode(CodeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_UpdatePhoneViewTextEditingControllers.containsKey(key)) {
      return _UpdatePhoneViewTextEditingControllers[key]!;
    }

    _UpdatePhoneViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _UpdatePhoneViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_UpdatePhoneViewFocusNodes.containsKey(key)) {
      return _UpdatePhoneViewFocusNodes[key]!;
    }
    _UpdatePhoneViewFocusNodes[key] = FocusNode();
    return _UpdatePhoneViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    phoneController.addListener(() => _updateFormData(model));
    codeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    phoneController.addListener(() => _updateFormData(model));
    codeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PhoneValueKey: phoneController.text,
          CodeValueKey: codeController.text,
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

    for (var controller in _UpdatePhoneViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _UpdatePhoneViewFocusNodes.values) {
      focusNode.dispose();
    }

    _UpdatePhoneViewTextEditingControllers.clear();
    _UpdatePhoneViewFocusNodes.clear();
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

  String? get phoneValue => this.formValueMap[PhoneValueKey] as String?;
  String? get codeValue => this.formValueMap[CodeValueKey] as String?;

  set phoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneValueKey: value}),
    );

    if (_UpdatePhoneViewTextEditingControllers.containsKey(PhoneValueKey)) {
      _UpdatePhoneViewTextEditingControllers[PhoneValueKey]?.text = value ?? '';
    }
  }

  set codeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CodeValueKey: value}),
    );

    if (_UpdatePhoneViewTextEditingControllers.containsKey(CodeValueKey)) {
      _UpdatePhoneViewTextEditingControllers[CodeValueKey]?.text = value ?? '';
    }
  }

  bool get hasPhone =>
      this.formValueMap.containsKey(PhoneValueKey) &&
      (phoneValue?.isNotEmpty ?? false);
  bool get hasCode =>
      this.formValueMap.containsKey(CodeValueKey) &&
      (codeValue?.isNotEmpty ?? false);

  bool get hasPhoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey]?.isNotEmpty ?? false;
  bool get hasCodeValidationMessage =>
      this.fieldsValidationMessages[CodeValueKey]?.isNotEmpty ?? false;

  String? get phoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey];
  String? get codeValidationMessage =>
      this.fieldsValidationMessages[CodeValueKey];
}

extension Methods on FormStateHelper {
  setPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneValueKey] = validationMessage;
  setCodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CodeValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    phoneValue = '';
    codeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      CodeValueKey: getValidationMessage(CodeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _UpdatePhoneViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _UpdatePhoneViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      CodeValueKey: getValidationMessage(CodeValueKey),
    });
