import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../views/register/form_validator.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    super.key,
    required this.label,
    this.controller,
    this.focusNode,
  });

  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;

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
          initialCountryCode: 'NG',
          showDropdownIcon: false,
          showCountryFlag: false,
          disableLengthCheck: true,
          flagsButtonPadding: const EdgeInsets.only(left: 10),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Your phone number',
            contentPadding: const EdgeInsets.all(12).r,
            prefixIcon: const SizedBox(width: 10),
          ),
          controller: controller,
          focusNode: focusNode,
          validator: (value) => FormValidator.phone(value?.completeNumber),
        ),
      ],
    );
  }
}
