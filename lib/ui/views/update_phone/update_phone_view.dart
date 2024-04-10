import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../widgets/app_back_button.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/phone_form_field.dart';
import '../../widgets/primary_button.dart';
import 'form_validator.dart';
import 'update_phone_view.form.dart';
import 'update_phone_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'phone', validator: FormValidator.phone),
  FormTextField(name: 'code', validator: FormValidator.code),
])
class UpdatePhoneView extends StackedView<UpdatePhoneViewModel>
    with $UpdatePhoneView {
  const UpdatePhoneView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Phone Number', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!viewModel.codeSent)
              Text(
                'You can change your phone number by putting in the new phone number below.',
                style: context.subtitleStyle,
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
                enabled: !viewModel.isBusy,
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
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: viewModel.resend,
                    child: const Text('Resend'),
                  ),
                  TextButton(
                    onPressed: viewModel.cancel,
                    child: const Text('Cancel'),
                  )
                ],
              ),
              60.verticalSpace,
            ],
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(UpdatePhoneViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(UpdatePhoneViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  UpdatePhoneViewModel viewModelBuilder(context) => UpdatePhoneViewModel();
}
