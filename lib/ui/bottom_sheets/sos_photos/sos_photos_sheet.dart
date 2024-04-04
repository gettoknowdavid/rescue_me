import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../widgets/app_text_button.dart';
import '../../widgets/selected_image_widget.dart';
import '../bottom_sheet_container.dart';
import 'sos_photos_sheet_model.dart';

class SosPhotosSheet extends StackedView<SosPhotosSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const SosPhotosSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    return BottomSheetContainer(
      child: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Emergency Photos',
                  style: context.appBarTitleStyle,
                ),
                AppTextButton(onTap: viewModel.getImages, label: 'Add Photos'),
              ],
            ),
            const Divider(),
            10.verticalSpace,
            Wrap(
              spacing: 16.r,
              runSpacing: 20.r,
              children: viewModel.images
                  .map((e) => SelectedImageWidget(
                      file: e, onRemove: () => viewModel.removeImage(e!)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(SosPhotosSheetModel viewModel) {
    viewModel.dispose();
    super.onDispose(viewModel);
  }

  @override
  void onViewModelReady(SosPhotosSheetModel viewModel) {
    viewModel.initialize(request.data ?? []);
    super.onViewModelReady(viewModel);
  }

  @override
  SosPhotosSheetModel viewModelBuilder(context) => SosPhotosSheetModel();
}
