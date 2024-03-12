import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked_services/stacked_services.dart';

class LogoutDialogContentText extends StatelessWidget {
  const LogoutDialogContentText({super.key, required this.request});

  final DialogRequest request;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: 'A verification mail has been sent to '),
          TextSpan(
            text: request.description,
            style: context.subtitleStyle?.copyWith(
              fontSize: 12.r,
              color: colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: '. Once verified, your mail will be changed. '
                '\nClick okay to sign out and sign in again.',
          ),
        ],
      ),
      style: context.subtitleStyle?.copyWith(fontSize: 12.r),
    );
  }
}
