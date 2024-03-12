import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/app_text_form_field.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_password_view.form.dart';
import 'edit_password_viewmodel.dart';
import 'form_validator.dart';

@FormView(fields: [
  FormTextField(name: 'oldPassword', validator: FormValidator.oldPassword),
  FormTextField(name: 'newPassword', validator: FormValidator.newPassword),
])
class EditPasswordView extends StackedView<EditPasswordViewModel>
    with $EditPasswordView {
  const EditPasswordView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Password', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You can change your password by putting in your old password and the new password.',
              style: context.subtitleStyle,
            ),
            20.verticalSpace,
            AppTextFormField(
              label: 'Old Password',
              hint: 'Your old Password',
              controller: oldPasswordController,
              focusNode: oldPasswordFocusNode,
              validator: FormValidator.oldPassword,
              isPassword: true,
              enabled: !viewModel.isBusy || !viewModel.sent,
            ),
            16.verticalSpace,
            AppTextFormField(
              label: 'New Password',
              hint: 'Your new Password',
              controller: newPasswordController,
              focusNode: newPasswordFocusNode,
              validator: FormValidator.newPassword,
              isPassword: true,
              enabled: !viewModel.isBusy || !viewModel.sent,
            ),
            30.verticalSpace,
            PrimaryButton(
              label: 'Submit',
              disabled: viewModel.disabled,
              loading: viewModel.isBusy,
              onPressed: viewModel.submit,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(EditPasswordViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(EditPasswordViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  EditPasswordViewModel viewModelBuilder(context) => EditPasswordViewModel();
}
