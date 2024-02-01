import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../widgets/auth_redirect_button.dart';
import 'form_validator.dart';
import 'register_form_widget.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: FormValidator.name),
  FormTextField(name: 'email', validator: FormValidator.email),
  FormTextField(name: 'phone', validator: FormValidator.phone),
  FormTextField(name: 'password', validator: FormValidator.password),
])
class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Register',
              style: textTheme.headlineMedium,
            ),
            4.verticalSpace,
            Text(
              "You're new here, register your new account to have a more secured experience.",
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onBackground.withOpacity(0.8),
              ),
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
