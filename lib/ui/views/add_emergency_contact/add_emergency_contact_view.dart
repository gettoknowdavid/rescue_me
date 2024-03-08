import 'dart:io';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/views/add_emergency_contact/add_emergency_contact_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../models/emergency_contact.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/phone_form_field.dart';
import '../../widgets/primary_button.dart';
import 'add_emergency_contact_viewmodel.dart';
import 'form_validator.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: FormValidator.name),
  FormTextField(name: 'email', validator: FormValidator.email),
  FormTextField(name: 'phone', validator: FormValidator.phone),
  FormDropdownField(name: 'type', items: [
    StaticDropdownItem(title: 'Police', value: 'Police'),
    StaticDropdownItem(title: 'Ambulance', value: 'Ambulance'),
    StaticDropdownItem(title: 'Fire', value: 'Fire'),
    StaticDropdownItem(title: 'Personal', value: 'Personal'),
  ]),
  FormTextField(name: 'imageUrl'),
])
class AddEmergencyContactView extends StackedView<AddEMCViewModel>
    with $AddEmergencyContactView {
  final bool isEditing;
  final EmergencyContact? contact;
  final File? imageFile;

  const AddEmergencyContactView({
    super.key,
    this.contact,
    this.isEditing = false,
    this.imageFile,
  });

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final title = isEditing ? contact!.name : 'New Emergency Contact';

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ContactAvatar(
              contact: contact,
              file: viewModel.image,
              onTap: viewModel.selectImage,
              onRemove: () {
                imageUrlController.text = '';
                viewModel.removeImage();
              },
            ),
            25.verticalSpace,
            AppTextFormField(
              label: 'Name',
              hint: 'Contact\'s name',
              controller: nameController,
              focusNode: nameFocusNode,
              validator: FormValidator.name,
            ),
            20.verticalSpace,
            AppTextFormField(
              label: 'Email',
              hint: 'Contact\'s email address',
              controller: emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              validator: FormValidator.email,
            ),
            20.verticalSpace,
            PhoneFormField(
              label: 'Phone Number',
              hint: '8012345678',
              initialCountryCode: viewModel.getCountryCode(contact?.phone),
              initialValue: viewModel.getInitialPhoneValue(contact?.phone),
              onChanged: (e) => phoneController.text = e.completeNumber,
              focusNode: phoneFocusNode,
              validator: (value) => FormValidator.phone(value?.completeNumber),
            ),
            20.verticalSpace,
            Text(
              'Emergency Type',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
            Wrap(
              spacing: 6.r,
              children: EmergencyContactType.values.map((type) {
                return ChoiceChip(
                  label: Text(
                    type.name.toUpperCase(),
                    style: theme.chipTheme.labelStyle?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(4, 1, 4, 1).r,
                  selected: type == viewModel.type,
                  labelStyle: textTheme.labelSmall,
                  showCheckmark: false,
                  onSelected: (value) => viewModel.onEMCTypeChanged(type),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 8.r,
                      cornerSmoothing: 1,
                    ),
                  ),
                );
              }).toList(),
            ),
            30.verticalSpace,
            PrimaryButton(
              label: isEditing ? 'Save' : 'Create Contact',
              disabled: viewModel.disabled,
              loading: viewModel.isBusy,
              onPressed: contact != null
                  ? () => viewModel.update(contact!)
                  : () => viewModel.create(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(AddEMCViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(AddEMCViewModel viewModel) {
    if (imageFile != null) {
      viewModel.setImageFile(imageFile!);
    }

    if (contact != null) {
      nameController.text = contact!.name;
      emailController.text = contact!.email ?? '';
      phoneController.text = contact!.phone;
      imageUrlController.text = contact!.imageUrl ?? '';
      viewModel.initializeEMCType(contact!.type);
    }
    syncFormWithViewModel(viewModel);
  }

  @override
  AddEMCViewModel viewModelBuilder(context) => AddEMCViewModel();
}

class ContactAvatar extends HookWidget {
  const ContactAvatar({
    super.key,
    required this.contact,
    this.file,
    this.onTap,
    required this.onRemove,
  });

  final EmergencyContact? contact;
  final File? file;
  final VoidCallback? onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final decoratedImage = useState<DecorationImage?>(null);

    useEffect(() {
      if (contact?.imageUrl != null) {
        decoratedImage.value = DecorationImage(
          image: NetworkImage(contact!.imageUrl!),
          fit: BoxFit.cover,
        );
      }

      return null;
    }, const []);

    if (file != null) {
      decoratedImage.value = DecorationImage(
        image: FileImage(file!),
        fit: BoxFit.cover,
      );
    }

    return Center(
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              height: 120.r,
              width: 120.r,
              decoration: ShapeDecoration(
                color: colorScheme.background,
                image: decoratedImage.value,
                shape: SmoothRectangleBorder(
                  side: BorderSide(
                    color: colorScheme.onBackground.withOpacity(0.6),
                  ),
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 20.r,
                    cornerSmoothing: 1,
                  ),
                ),
              ),
              child: file == null || contact?.imageUrl == null
                  ? const PhosphorIcon(PhosphorIconsDuotone.image)
                  : null,
            ),
          ),
          if (contact != null && contact!.imageUrl != null) ...[
            10.verticalSpace,
            TextButton(
              onPressed: () {
                decoratedImage.value = null;
                onRemove();
              },
              style: TextButton.styleFrom(
                textStyle: textTheme.labelMedium,
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0).r,
              ),
              child: const Text('Remove Image?'),
            ),
          ],
        ],
      ),
    );
  }
}
