import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';

import 'verify_email_viewmodel.dart';

class VerifyEmailView extends StackedView<VerifyEmailViewModel> {
  const VerifyEmailView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text('Verify your email', style: context.headline),
            10.verticalSpace,
            Text(
              'Open your mail application to check for the verification mail we just sent to you.',
              style: context.confirmationBodyStyle,
            ),
            20.verticalSpace,
            PrimaryButton(
              label: 'Open mail app',
              onPressed: viewModel.openMailApp,
            ),
            20.verticalSpace,
            OutlinedButton(
              onPressed: viewModel.checkEmailVerified,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
                fixedSize: Size(1.sw, 53),
              ),
              child: const Text('Verify'),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: viewModel.sendVerification,
                  child: const Text('Resend'),
                ),
                TextButton(
                  onPressed: viewModel.cancel,
                  child: const Text('Cancel'),
                )
              ],
            ),
            60.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  VerifyEmailViewModel viewModelBuilder(context) => VerifyEmailViewModel();
}
