import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/app_text_form_field.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'form_validator.dart';
import 're_auth_view.form.dart';
import 're_auth_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'password', validator: FormValidator.password),
])
class ReAuthView extends StackedView<ReAuthViewModel> with $ReAuthView {
  const ReAuthView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify your password', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Re-enter your RescueMe password to continue with the change of email.',
              style: context.subtitleStyle,
            ),
            20.verticalSpace,
            AppTextFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              label: 'Password',
              hint: 'Your password',
              isPassword: true,
              enabled: !viewModel.isBusy,
              validator: FormValidator.password,
            ),
            30.verticalSpace,
            PrimaryButton(
              label: 'Next',
              disabled: viewModel.disabled,
              loading: viewModel.isBusy,
              onPressed: viewModel.next,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(ReAuthViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(ReAuthViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  ReAuthViewModel viewModelBuilder(context) => ReAuthViewModel();
}
