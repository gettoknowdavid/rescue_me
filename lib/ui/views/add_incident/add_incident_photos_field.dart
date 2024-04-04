import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/views/add_incident/add_incident_viewmodel.dart';
import 'package:rescue_me/ui/widgets/selected_image_widget.dart';
import 'package:stacked/stacked.dart';

class AddIncidentPhotosField extends ViewModelWidget<AddIncidentViewModel> {
  const AddIncidentPhotosField({super.key});

  @override
  Widget build(BuildContext context, AddIncidentViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Photos', style: context.fieldLabel),
        4.verticalSpace,
        Wrap(
          spacing: 16.r,
          alignment: WrapAlignment.start,
          children: [
            SelectedImageWidget(onAdd: viewModel.getImages),
            if (viewModel.photoUrls.isNotEmpty)
              ...viewModel.photoUrls.map((e) => SelectedImageWidget(url: e))
            else
              ...viewModel.images.map(
                (e) => SelectedImageWidget(
                  file: e,
                  loading: viewModel.isBusy,
                  onRemove: () => viewModel.removeImage(e!),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
