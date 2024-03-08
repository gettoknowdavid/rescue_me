import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../bottom_sheet_container.dart';
import 'image_source_sheet_model.dart';

class ImageSourceSheet extends StackedView<ImageSourceSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const ImageSourceSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    return BottomSheetContainer(
      child: Wrap(
        children: [
          ListTile(
            leading: const PhosphorIcon(PhosphorIconsDuotone.image),
            title: const Text('Pick from Gallery'),
            onTap: () async {
              final file = await viewModel.imageChanged(true);
              completer!(SheetResponse(data: file));
            },
          ),
          Divider(endIndent: 16.r, indent: 16.r, height: 2.r),
          ListTile(
            leading: const PhosphorIcon(PhosphorIconsDuotone.camera),
            title: const Text('Use Camera'),
            onTap: () async {
              final file = await viewModel.imageChanged(false);
              completer!(SheetResponse(data: file));
            },
          ),
        ],
      ),
    );
  }

  @override
  ImageSourceSheetModel viewModelBuilder(context) => ImageSourceSheetModel();
}
