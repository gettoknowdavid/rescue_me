import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../widgets/app_back_button.dart';
import '../../widgets/auth_redirect_button.dart';
import 'form_validator.dart';
import 'register_form_widget.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: FormValidator.name),
  FormTextField(name: 'email', validator: FormValidator.email),
  FormTextField(name: 'password', validator: FormValidator.password),
])
class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Register', style: context.headline),
            4.verticalSpace,
            Text(
              "You're new here, register your new account to have a more secured experience.",
              style: context.subtitleStyle,
            ),
            30.verticalSpace,
            RegisterFormWidget(),
            30.verticalSpace,
            AuthRedirectButton(
              text: 'Already have an account?',
              buttonLabel: 'Go back to Login',
              onTap: viewModel.goToLogin,
            ),
          ],
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(context) => RegisterViewModel();
}
