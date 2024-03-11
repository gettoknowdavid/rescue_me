import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.label,
    this.hint,
    this.isPassword = false,
    this.focusNode,
    this.controller,
    this.validator,
    this.keyboardType,
    this.prefixText,
    this.enabled,
  });

  final String label;
  final String? hint;
  final bool isPassword;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? prefixText;
  final bool? enabled;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: textTheme.bodySmall?.copyWith(
            color: widget.focusNode?.hasFocus == true
                ? colorScheme.primary
                : colorScheme.onBackground.withOpacity(0.6),
          ),
        ),
        4.verticalSpace,
        TextFormField(
          enabled: widget.enabled,
          controller: widget.controller,
          focusNode: widget.focusNode,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintText: widget.hint,
            contentPadding: const EdgeInsets.all(12).r,
            prefixText: widget.prefixText,
            suffixIcon: !widget.isPassword ? null : _suffixIcon(),
          ),
        ),
      ],
    );
  }

  Widget _suffixIcon() => Semantics(
        button: true,
        attributedLabel: AttributedString('Hide Password'),
        child: IconButton(
          onPressed: () => setState(() => isObscure = !isObscure),
          icon: isObscure
              ? Icon(PhosphorIcons.eye())
              : Icon(PhosphorIcons.eyeSlash()),
        ),
      );
}
