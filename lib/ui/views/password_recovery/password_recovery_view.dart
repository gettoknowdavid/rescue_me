import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/views/password_recovery/password_recovery_view.form.dart';
import 'package:rescue_me/ui/widgets/app_text_form_field.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'form_validator.dart';
import 'password_recovery_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: FormValidator.email),
])
class PasswordRecoveryView extends StackedView<PasswordRecoveryViewModel>
    with $PasswordRecoveryView {
  const PasswordRecoveryView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [const SliverAppBar()],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Forgot Password', style: textTheme.headlineMedium),
              10.verticalSpace,
              Text(
                "Don't worry! It happens. Please enter the address associated with your account.",
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onBackground.withOpacity(0.8),
                ),
              ),
              30.verticalSpace,
              AppTextFormField(
                hint: 'Your Email',
                label: 'Email',
                controller: emailController,
                focusNode: emailFocusNode,
                validator: FormValidator.email,
              ),
              40.verticalSpace,
              ElevatedButton(
                onPressed: viewModel.disabled ? null : viewModel.submit,
                child: viewModel.isBusy
                    ? const LoadingWidget()
                    : const Text('Submit'),
              ),
              120.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(PasswordRecoveryViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(PasswordRecoveryViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  PasswordRecoveryViewModel viewModelBuilder(context) =>
      PasswordRecoveryViewModel();
}
