import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/models/incident.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/app_text_form_field.dart';
import 'package:rescue_me/ui/widgets/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'add_incident_photos_field.dart';
import 'add_incident_view.form.dart';
import 'add_incident_viewmodel.dart';
import 'form_validator.dart';

@FormView(fields: [
  FormDropdownField(name: 'type', items: [
    StaticDropdownItem(title: 'Fire', value: 'Fire'),
    StaticDropdownItem(title: 'Accident', value: 'Accident'),
    StaticDropdownItem(title: 'Robbery', value: 'Robbery'),
    StaticDropdownItem(title: 'Medical', value: 'Medical'),
    StaticDropdownItem(title: 'Other', value: 'Other'),
  ]),
  FormDropdownField(name: 'severity', items: [
    StaticDropdownItem(title: 'Low', value: 'Low'),
    StaticDropdownItem(title: 'Medium', value: 'Medium'),
    StaticDropdownItem(title: 'High', value: 'High'),
  ]),
  FormTextField(name: 'title', validator: FormValidator.title),
  FormTextField(name: 'description'),
  FormTextField(name: 'address', validator: FormValidator.address),
])
class AddIncidentView extends StackedView<AddIncidentViewModel>
    with $AddIncidentView {
  const AddIncidentView({super.key, this.incident});

  final Incident? incident;

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Incident', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              title: const Text('Want to be Anonymous?'),
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0).r,
              value: viewModel.anonymous,
              onChanged: viewModel.setAnonymous,
            ),
            10.verticalSpace,
            AppTextFormField(
              label: 'Title',
              hint: 'Title of Incident',
              controller: titleController,
              focusNode: titleFocusNode,
              validator: FormValidator.title,
              enabled: !viewModel.isBusy,
            ),
            15.verticalSpace,
            AppTextFormField(
              label: 'Address',
              hint: 'Address of Incident',
              controller: addressController,
              focusNode: addressFocusNode,
              validator: FormValidator.address,
              enabled: !viewModel.isBusy,
            ),
            15.verticalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: descriptionFocusNode.hasFocus == true
                      ? context.fieldLabelFocused
                      : context.fieldLabel,
                ),
                4.verticalSpace,
                TextFormField(
                  maxLines: 3,
                  maxLength: 244,
                  controller: descriptionController,
                  focusNode: descriptionFocusNode,
                  decoration: InputDecoration(
                    hintText: 'What\'s happening?',
                    contentPadding: const EdgeInsets.all(12).r,
                    counter: const Offstage(),
                    enabled: !viewModel.isBusy,
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            const AddIncidentPhotosField(),
            15.verticalSpace,
            Text('Incident Type', style: context.fieldLabel),
            Wrap(
              spacing: 6.r,
              children: IncidentType.values.map((type) {
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
                  onSelected: (_) => viewModel.onIncidentTypeChanged(type),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 8.r,
                      cornerSmoothing: 1,
                    ),
                  ),
                );
              }).toList(),
            ),
            15.verticalSpace,
            Text('Incident Severity', style: context.fieldLabel),
            Wrap(
              spacing: 6.r,
              children: IncidentSeverity.values.map((severity) {
                return ChoiceChip(
                  selectedColor: severity.color,
                  label: Text(
                    severity.name.toUpperCase(),
                    style: theme.chipTheme.labelStyle?.copyWith(
                      color: severity.onColor,
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(4, 1, 4, 1).r,
                  selected: severity == viewModel.severity,
                  labelStyle: textTheme.labelSmall,
                  showCheckmark: false,
                  onSelected: (_) => viewModel.onIncidentSeverityChanged(
                    severity,
                  ),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 8.r,
                      cornerSmoothing: 1,
                    ),
                  ),
                );
              }).toList(),
            ),
            20.verticalSpace,
            PrimaryButton(
              label: incident != null ? 'Save Changes' : 'Create Incident',
              disabled: viewModel.disabled,
              loading: viewModel.isBusy,
              onPressed: () => viewModel.create(),
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(AddIncidentViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(AddIncidentViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.setType(IncidentType.other.name);
    viewModel.setSeverity(IncidentSeverity.low.name);

    if (incident != null) {
      titleController.text = incident!.title;
      addressController.text = incident!.address;
      descriptionController.text = incident?.description ?? '';
      viewModel.setPhotoURLs(incident?.photoUrls ?? []);
      viewModel.setType(incident!.type.name);
      viewModel.setSeverity(incident!.severity.name);
      viewModel.setAnonymous(incident!.anonymous);
    }
  }

  @override
  AddIncidentViewModel viewModelBuilder(context) => AddIncidentViewModel();
}
