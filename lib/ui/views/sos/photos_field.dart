import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/widgets/selected_image_widget.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/views/sos/sos_viewmodel.dart';
import 'package:rescue_me/ui/widgets/app_text_button.dart';
import 'package:stacked/stacked.dart';

class PhotosField extends ViewModelWidget<SosViewModel> {
  const PhotosField({super.key});

  @override
  Widget build(BuildContext context, SosViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Photos', style: context.fieldLabel),
        const Divider(),
        4.verticalSpace,
        Wrap(
          spacing: 16.r,
          alignment: WrapAlignment.start,
          children: [
            SelectedImageWidget(onAdd: viewModel.getImages),
            if (viewModel.imageUrls.isNotEmpty)
              ...viewModel.imageUrls.map(
                (e) => SelectedImageWidget(url: e),
              )
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
        if (viewModel.images.isNotEmpty) ...[
          4.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: AppTextButton(
              label: 'Upload Photos',
              onTap: viewModel.uploadPhotos,
            ),
          ),
        ],
      ],
    );
  }
}
