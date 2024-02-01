import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_text_form_field.dart';
import '../../widgets/auth_redirect_button.dart';
import '../../widgets/primary_button.dart';
import 'form_validator.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

class LoginFormWidget extends StackedView<LoginViewModel> with $LoginView {
  const LoginFormWidget({super.key});

  @override
  Widget builder(context, viewModel, child) => Form(
        child: Builder(
          builder: (formContext) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextFormField(
                controller: emailController,
                focusNode: emailFocusNode,
                label: 'Email Address',
                hint: 'johndoe@example.com',
                keyboardType: TextInputType.emailAddress,
                validator: FormValidator.email,
              ),
              15.verticalSpace,
              AppTextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                label: 'Password',
                hint: 'Your password',
                isPassword: true,
                validator: FormValidator.password,
              ),
              12.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: AuthRedirectButton(
                  buttonLabel: 'Forgot Password?',
                  onTap: viewModel.goToPasswordRecovery,
                ),
              ),
              30.verticalSpace,
              PrimaryButton(
                label: 'Login',
                disabled: viewModel.disabled,
                loading: viewModel.isBusy,
                onPressed: viewModel.login,
              ),
            ],
          ),
        ),
      );

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(context) => LoginViewModel();
}
