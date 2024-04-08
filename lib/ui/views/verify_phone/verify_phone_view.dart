import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_text_form_field.dart';
import 'package:rescue_me/ui/widgets/phone_form_field.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'form_validator.dart';
import 'verify_phone_view.form.dart';
import 'verify_phone_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phone', validator: FormValidator.phone),
  FormTextField(name: 'code', validator: FormValidator.code),
])
class VerifyPhoneView extends StackedView<VerifyPhoneViewModel>
    with $VerifyPhoneView {
  const VerifyPhoneView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Verify Phone Number', style: context.headline),
            4.verticalSpace,
            if (!viewModel.codeSent)
              Text(
                "Congratulations on successful registration, but yes, there's another form. \n\nWe know, it sucks, but we actually do need your phone number so we can easily contact you in case of an emergency.",
                style: context.confirmationBodyStyle,
              )
            else
              Text(
                'We have just sent a code to you via SMS. \n\nInsert the code and verify your phone number.',
                style: context.confirmationBodyStyle,
              ),
            30.verticalSpace,
            if (!viewModel.codeSent) ...[
              PhoneFormField(
                label: 'Phone Number',
                focusNode: phoneFocusNode,
                onChanged: (phone) {
                  phoneController.text = phone.completeNumber;
                  viewModel.onPhoneChanged(phone);
                },
                validator: (phone) {
                  if (phone != null && phone.isValidNumber()) return null;
                  const message = 'Please enter a valid phone number';
                  viewModel.setPhoneValidationMessage(message);
                  return message;
                },
              ),
              30.verticalSpace,
              PrimaryButton(
                label: 'Verify',
                disabled: viewModel.disabled,
                loading: viewModel.isBusy,
                onPressed: viewModel.verifyPhone,
              ),
            ] else ...[
              AppTextFormField(
                label: 'Verification Code',
                hint: 'The SMS Code',
                focusNode: codeFocusNode,
                controller: codeController,
                validator: FormValidator.code,
              ),
              30.verticalSpace,
              PrimaryButton(
                label: 'Verify',
                disabled: viewModel.codeBoxDisabled,
                loading: viewModel.isBusy,
                onPressed: viewModel.updatePhone,
              ),
            ]
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(VerifyPhoneViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(VerifyPhoneViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  VerifyPhoneViewModel viewModelBuilder(context) => VerifyPhoneViewModel();
}
