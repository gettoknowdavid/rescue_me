// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:rescue_me/ui/views/add_incident/form_validator.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String TypeValueKey = 'type';
const String SeverityValueKey = 'severity';
const String TitleValueKey = 'title';
const String DescriptionValueKey = 'description';
const String AddressValueKey = 'address';

final Map<String, String> TypeValueToTitleMap = {
  'Fire': 'Fire',
  'Accident': 'Accident',
  'Robbery': 'Robbery',
  'Medical': 'Medical',
  'Other': 'Other',
};
final Map<String, String> SeverityValueToTitleMap = {
  'Low': 'Low',
  'Medium': 'Medium',
  'High': 'High',
};

final Map<String, TextEditingController>
    _AddIncidentViewTextEditingControllers = {};

final Map<String, FocusNode> _AddIncidentViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddIncidentViewTextValidations =
    {
  TitleValueKey: FormValidator.title,
  DescriptionValueKey: null,
  AddressValueKey: FormValidator.address,
};

mixin $AddIncidentView {
  TextEditingController get titleController =>
      _getFormTextEditingController(TitleValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);

  FocusNode get titleFocusNode => _getFormFocusNode(TitleValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddIncidentViewTextEditingControllers.containsKey(key)) {
      return _AddIncidentViewTextEditingControllers[key]!;
    }

    _AddIncidentViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddIncidentViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddIncidentViewFocusNodes.containsKey(key)) {
      return _AddIncidentViewFocusNodes[key]!;
    }
    _AddIncidentViewFocusNodes[key] = FocusNode();
    return _AddIncidentViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    titleController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    titleController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TitleValueKey: titleController.text,
          DescriptionValueKey: descriptionController.text,
          AddressValueKey: addressController.text,
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

    for (var controller in _AddIncidentViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddIncidentViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddIncidentViewTextEditingControllers.clear();
    _AddIncidentViewFocusNodes.clear();
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

  String? get typeValue => this.formValueMap[TypeValueKey] as String?;
  String? get severityValue => this.formValueMap[SeverityValueKey] as String?;
  String? get titleValue => this.formValueMap[TitleValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;

  set titleValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TitleValueKey: value}),
    );

    if (_AddIncidentViewTextEditingControllers.containsKey(TitleValueKey)) {
      _AddIncidentViewTextEditingControllers[TitleValueKey]?.text = value ?? '';
    }
  }

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DescriptionValueKey: value}),
    );

    if (_AddIncidentViewTextEditingControllers.containsKey(
        DescriptionValueKey)) {
      _AddIncidentViewTextEditingControllers[DescriptionValueKey]?.text =
          value ?? '';
    }
  }

  set addressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AddressValueKey: value}),
    );

    if (_AddIncidentViewTextEditingControllers.containsKey(AddressValueKey)) {
      _AddIncidentViewTextEditingControllers[AddressValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasType => this.formValueMap.containsKey(TypeValueKey);
  bool get hasSeverity => this.formValueMap.containsKey(SeverityValueKey);
  bool get hasTitle =>
      this.formValueMap.containsKey(TitleValueKey) &&
      (titleValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);
  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);

  bool get hasTypeValidationMessage =>
      this.fieldsValidationMessages[TypeValueKey]?.isNotEmpty ?? false;
  bool get hasSeverityValidationMessage =>
      this.fieldsValidationMessages[SeverityValueKey]?.isNotEmpty ?? false;
  bool get hasTitleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;

  String? get typeValidationMessage =>
      this.fieldsValidationMessages[TypeValueKey];
  String? get severityValidationMessage =>
      this.fieldsValidationMessages[SeverityValueKey];
  String? get titleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
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

  void setSeverity(String severity) {
    this.setData(
      this.formValueMap..addAll({SeverityValueKey: severity}),
    );

    if (_autoTextFieldValidation) {
      this.validateForm();
    }
  }

  setTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TypeValueKey] = validationMessage;
  setSeverityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SeverityValueKey] = validationMessage;
  setTitleValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    titleValue = '';
    descriptionValue = '';
    addressValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TitleValueKey: getValidationMessage(TitleValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddIncidentViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddIncidentViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TitleValueKey: getValidationMessage(TitleValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
