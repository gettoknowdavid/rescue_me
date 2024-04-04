import 'dart:io';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

final smoothRectangleBorder = SmoothRectangleBorder(
  borderRadius: SmoothBorderRadius(
    cornerRadius: 12.r,
    cornerSmoothing: 1,
  ),
);

class SelectedImageWidget extends StatelessWidget {
  const SelectedImageWidget({
    super.key,
    this.file,
    this.url,
    this.onRemove,
    this.onAdd,
    this.loading = false,
  });

  final File? file;
  final String? url;
  final VoidCallback? onRemove;
  final VoidCallback? onAdd;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hasImage = file != null || url != null;

    final size = 60.r;

    if (!hasImage && onAdd != null) {
      return InkWell(
        onTap: onAdd,
        borderRadius: smoothRectangleBorder.borderRadius,
        child: Container(
          height: size,
          width: size,
          decoration: ShapeDecoration(
            color: colorScheme.surfaceVariant,
            shape: smoothRectangleBorder,
          ),
          child: const PhosphorIcon(PhosphorIconsBold.plus),
        ),
      );
    }

    DecorationImage? image;

    if (file != null) {
      image = DecorationImage(image: FileImage(file!), fit: BoxFit.cover);
    }

    if (url != null && file == null) {
      image = DecorationImage(image: NetworkImage(url!), fit: BoxFit.cover);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size,
          width: size,
          decoration: ShapeDecoration(
            color: colorScheme.surfaceVariant,
            shape: smoothRectangleBorder,
            image: image,
          ),
          alignment: Alignment.center,
          child: !loading
              ? null
              : SizedBox(
                  height: 30.r,
                  width: 30.r,
                  child: const CircularProgressIndicator(),
                ),
        ),
        if (file != null || !loading && onRemove != null)
          Positioned(
            right: -8.r,
            top: -8.r,
            child: IconButton.filled(
              onPressed: onRemove,
              iconSize: 16.r,
              style: IconButton.styleFrom(
                fixedSize: Size(24.r, 24.r),
                maximumSize: Size(24.r, 24.r),
                minimumSize: Size(24.r, 24.r),
                padding: EdgeInsets.zero,
              ),
              icon: const Icon(PhosphorIconsBold.x),
            ),
          ),
      ],
    );
  }
}
