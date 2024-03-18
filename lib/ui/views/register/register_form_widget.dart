import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_text_form_field.dart';
import '../../widgets/primary_button.dart';
import 'form_validator.dart';
import 'register_view.form.dart';
import 'register_viewmodel.dart';

class RegisterFormWidget extends StackedView<RegisterViewModel>
    with $RegisterView {
  RegisterFormWidget({super.key});

  @override
  Widget builder(context, viewModel, child) => Form(
        autovalidateMode: AutovalidateMode.always,
        child: Builder(
          builder: (formContext) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextFormField(
                controller: nameController,
                focusNode: nameFocusNode,
                label: 'Full Name',
                hint: 'John Doe',
                validator: FormValidator.name,
              ),
              15.verticalSpace,
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
              30.verticalSpace,
              PrimaryButton(
                label: 'Register',
                disabled: viewModel.disabled,
                loading: viewModel.isBusy,
                onPressed: viewModel.register,
              ),
            ],
          ),
        ),
      );

  @override
  void onDispose(RegisterViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(context) => RegisterViewModel();
}
