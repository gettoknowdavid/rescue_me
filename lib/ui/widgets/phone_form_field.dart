import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:rescue_me/ui/common/app_styles.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.initialCountryCode = 'NG',
    this.initialValue,
    this.validator,
    this.enabled = true,
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(PhoneNumber)? onChanged;
  final String? initialCountryCode;
  final String? initialValue;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: focusNode?.hasFocus == true
              ? context.fieldLabelFocused
              : context.fieldLabel,
        ),
        4.verticalSpace,
        IntlPhoneField(
          initialCountryCode: initialCountryCode,
          initialValue: initialValue,
          showDropdownIcon: false,
          showCountryFlag: true,
          disableLengthCheck: true,
          enabled: enabled,
          flagsButtonPadding: const EdgeInsets.only(left: 10),
          keyboardType: TextInputType.phone,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: hint ?? 'Your phone number',
            contentPadding: const EdgeInsets.all(12).r,
            prefixIcon: const SizedBox(width: 10),
          ),
          onChanged: onChanged,
          controller: controller,
          focusNode: focusNode,
          validator: validator,
        ),
      ],
    );
  }
}
