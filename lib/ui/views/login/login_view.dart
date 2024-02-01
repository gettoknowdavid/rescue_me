import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../widgets/auth_redirect_button.dart';
import 'form_validator.dart';
import 'login_form_widget.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: FormValidator.email),
  FormTextField(name: 'password', validator: FormValidator.password),
])
class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar:   AppBar()  ,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Login', style: textTheme.headlineMedium),
            4.verticalSpace,
            Text(
              "Welcome back, you've been missed. Log in with your credentials to continue.",
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            30.verticalSpace,
            const LoginFormWidget(),
            30.verticalSpace,
            AuthRedirectButton(
              text: "Don't have an account yet?",
              buttonLabel: 'Create now',
              onTap: viewModel.goToRegister,
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(context) => LoginViewModel();
}
