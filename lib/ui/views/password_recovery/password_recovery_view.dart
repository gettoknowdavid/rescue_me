import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../widgets/app_back_button.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/primary_button.dart';
import 'form_validator.dart';
import 'password_recovery_view.form.dart';
import 'password_recovery_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: FormValidator.email),
])
class PasswordRecoveryView extends StackedView<PasswordRecoveryViewModel>
    with $PasswordRecoveryView {
  const PasswordRecoveryView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Forgot Password', style: context.headline),
            10.verticalSpace,
            Text(
              "Don't worry! It happens. Please enter the address associated with your account.",
              style: context.subtitleStyle,
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
            PrimaryButton(
              label: 'Submit',
              disabled: viewModel.disabled,
              loading: viewModel.isBusy,
              onPressed: viewModel.submit,
            ),
            120.verticalSpace,
          ],
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
