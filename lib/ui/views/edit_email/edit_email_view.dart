import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/app_text_form_field.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_email_view.form.dart';
import 'edit_email_viewmodel.dart';
import 'form_validator.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: FormValidator.email),
])
class EditEmailView extends StackedView<EditEmailViewModel>
    with $EditEmailView {
  const EditEmailView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Change email address', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Your current email address is '),
                  TextSpan(
                    text: viewModel.email,
                    style: context.subtitleStyle?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onBackground,
                    ),
                  ),
                  const TextSpan(
                    text: '. What would you like to update it to? '
                        '\n\nYour email address is not displayed in your public '
                        'profile on RescueMe.',
                  ),
                ],
              ),
              style: context.subtitleStyle,
            ),
            20.verticalSpace,
            AppTextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
              label: 'Email address',
              hint: 'Your new email',
              validator: FormValidator.email,
              keyboardType: TextInputType.emailAddress,
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
  void onDispose(EditEmailViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(EditEmailViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  EditEmailViewModel viewModelBuilder(context) => EditEmailViewModel();
}
