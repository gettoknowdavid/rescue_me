import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';

import 'confirmation_viewmodel.dart';

class ConfirmationView extends StackedView<ConfirmationViewModel> {
  const ConfirmationView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.all(16.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  width: constraints.maxWidth,
                  margin: const EdgeInsets.only(top: 30).r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: SmoothBorderRadius.all(
                      SmoothRadius(cornerRadius: 20.r, cornerSmoothing: 1),
                    ),
                  ),
                  child: Image.asset(
                    'assets/new-mail.png',
                    height: 260.r,
                    width: 260.r,
                  ),
                ),
              ),
              30.verticalSpace,
              Text(
                'You have mail',
                textAlign: TextAlign.center,
                style: context.headline,
              ),
              10.verticalSpace,
              Text(
                'A password recovery mail has been sent to your email. Click on the link to reset your password.',
                textAlign: TextAlign.center,
                style: context.subtitleStyle,
              ),
              30.verticalSpace,
              OutlinedButton.icon(
                icon: Icon(PhosphorIconsRegular.caretLeft, size: 18.r),
                label: const Text('Back to Login'),
                onPressed: viewModel.goToLogin,
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  ConfirmationViewModel viewModelBuilder(context) => ConfirmationViewModel();
}
