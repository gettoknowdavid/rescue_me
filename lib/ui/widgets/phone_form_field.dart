import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

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
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(PhoneNumber)? onChanged;
  final String? initialCountryCode;
  final String? initialValue;
  final FutureOr<String?> Function(PhoneNumber?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: focusNode?.hasFocus == true
                ? colorScheme.primary
                : colorScheme.onBackground.withOpacity(0.6),
          ),
        ),
        4.verticalSpace,
        IntlPhoneField(
          initialCountryCode: initialCountryCode,
          initialValue: initialValue,
          showDropdownIcon: false,
          showCountryFlag: true,
          disableLengthCheck: true,
          flagsButtonPadding: const EdgeInsets.only(left: 10),
          keyboardType: TextInputType.phone,
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
