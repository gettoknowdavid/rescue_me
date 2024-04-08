import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.all(16).r,
          child: Column(
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
                    'assets/onboarding.png',
                    height: 260.r,
                    width: 260.r,
                  ),
                ),
              ),
              30.verticalSpace,
              Text(
                'Good health is the greatest wealth',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.sp,
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                child: Text(
                  'Connecting with the app is good in any situation due to location track feature we contact you easily.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              30.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: viewModel.goToRegister,
                      child: const Text('Register'),
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: viewModel.goToLogin,
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(context) => OnboardingViewModel();
}
