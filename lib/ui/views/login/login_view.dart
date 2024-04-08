import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../widgets/app_back_button.dart';
import '../../widgets/auth_redirect_button.dart';
import 'form_validator.dart';
import 'login_form_widget.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: FormValidator.email),
  FormTextField(name: 'password', validator: FormValidator.password),
])
class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context) ? const AppBackButton() : null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Login', style: context.headline),
            4.verticalSpace,
            Text(
              "Welcome back, you've been missed. Log in with your email and password to continue.",
              style: context.subtitleStyle,
            ),
            30.verticalSpace,
            const LoginFormWidget(),
            30.verticalSpace,
            AuthRedirectButton(
              text: "Don't have an account yet?",
              buttonLabel: 'Register now',
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
