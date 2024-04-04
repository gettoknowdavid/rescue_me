import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/ui/widgets/app_text_button.dart';
import 'package:stacked/stacked.dart';

import 'call_field.dart';
import 'description_field.dart';
import 'photos_field.dart';
import 'sos_viewmodel.dart';

class SosView extends StackedView<SosViewModel> {
  const SosView({super.key, required this.report});

  final EmergencyReport report;

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 56, 16, 16).r,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Help is on the way!',
                textAlign: TextAlign.center,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onBackground.withOpacity(0.8),
                ),
              ),
              20.verticalSpace,
              Image.asset(
                'assets/SOS.png',
                height: 150.r,
                width: 150.r,
                color: colorScheme.error,
              ),
              20.verticalSpace,
              const CallField(),
              32.verticalSpace,
              const PhotosField(),
              DescriptionField(report: report),
              if (viewModel.description?.isNotEmpty == true || viewModel.isBusy)
                Align(
                  alignment: Alignment.centerRight,
                  child: AppTextButton(
                    label: 'Submit Description',
                    onTap: viewModel.addDescription,
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 26).r,
        child: OutlinedButton(
          onPressed: () => viewModel.resolve(report),
          child: const Text('I\'m safe now'),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(SosViewModel viewModel) {
    viewModel.initialize(report);
    super.onViewModelReady(viewModel);
  }

  @override
  SosViewModel viewModelBuilder(context) => SosViewModel();
}
