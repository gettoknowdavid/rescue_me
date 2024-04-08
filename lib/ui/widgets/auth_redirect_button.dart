import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthRedirectButton extends StatelessWidget {
  const AuthRedirectButton({
    super.key,
    this.text,
    required this.buttonLabel,
    required this.onTap,
  });

  final String? text;
  final String buttonLabel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
          letterSpacing: -0.2.r,
        );

    return SizedBox(
      height: 20.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text == null ? 0.horizontalSpace : Text(text!, style: style),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              textStyle: style,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0).r,
            ),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}
