import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/app_text_form_field.dart';
import 'package:rescue_me/ui/widgets/avatar.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_bio_view.form.dart';
import 'edit_bio_viewmodel.dart';
import 'form_validator.dart';
import 'remove_and_cancel_button.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: FormValidator.name),
])
class EditBioView extends StackedView<EditBioViewModel> with $EditBioView {
  const EditBioView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Bio', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Avatar(
                radius: 60.r,
                imageFile: viewModel.image,
                imageUrl: viewModel.imageUrl,
                name: viewModel.user.displayName,
                onTap: viewModel.isBusy ? null : viewModel.selectAvatar,
                showEditButton: true,
              ),
            ),
            10.verticalSpace,
            const RemoveAndCancelButton(),
            20.verticalSpace,
            AppTextFormField(
              label: 'Full Name',
              hint: 'John Doe',
              controller: nameController,
              focusNode: nameFocusNode,
              validator: FormValidator.name,
              enabled: !viewModel.isBusy,
            ),
            30.verticalSpace,
            PrimaryButton(
              label: 'Save',
              disabled: viewModel.isButtonDisabled,
              loading: viewModel.isBusy,
              onPressed: viewModel.save,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(EditBioViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(EditBioViewModel viewModel) {
    nameController.text = viewModel.user.displayName!;
    syncFormWithViewModel(viewModel);
  }

  @override
  EditBioViewModel viewModelBuilder(context) => EditBioViewModel();
}
