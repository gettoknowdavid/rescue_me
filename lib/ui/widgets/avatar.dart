import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final File? imageFile;
  final String? name;
  final double radius;
  final VoidCallback? onTap;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final bool showEditButton;
  final bool isEdited;

  const Avatar({
    super.key,
    this.radius = 16.0,
    this.imageUrl,
    this.imageFile,
    this.name,
    this.onTap,
    this.showEditButton = false,
    this.isEdited = false,
    this.onSave,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final hasNoImageUrl = imageUrl == null || imageUrl == ' ';
    final hasImage = imageFile != null || !hasNoImageUrl;

    Widget placeholder = Icon(PhosphorIconsDuotone.user, size: radius.r);

    if (!hasImage && name != null) {
      final initials = _getInitials(name!);

      final initialsFontSize = radius * 0.5;
      final initialsTextStyle = textTheme.bodyLarge?.copyWith(
        fontSize: initialsFontSize.r,
      );

      placeholder = Text(initials.toUpperCase(), style: initialsTextStyle);
    }

    final avatar = CircleAvatar(
      radius: radius.r,
      backgroundImage: !hasNoImageUrl ? NetworkImage(imageUrl!) : null,
      foregroundImage: imageFile != null ? FileImage(imageFile!) : null,
      child: !hasImage ? placeholder : null,
    );

    if (!showEditButton) return avatar;

    final diameter = radius * 2;

    return GestureDetector(
      onTap: showEditButton ? onTap : null,
      child: SizedBox(
        height: diameter.r,
        width: diameter.r,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            avatar,
            if (!isEdited)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primary,
                  ),
                  height: 36.r,
                  width: 36.r,
                  child: PhosphorIcon(
                    PhosphorIconsDuotone.pencil,
                    color: colorScheme.onPrimary,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

String _getInitials(String name) {
  // Split the name by spaces.
  final List<String> nameParts = name.trim().split(' ');

  // Handle empty string case.
  if (nameParts.isEmpty) {
    return '';
  }

  // If only one name is provided, return the first letter (uppercase).
  if (nameParts.length == 1) {
    return nameParts[0].substring(0, 1).toUpperCase();
  }

  // If multiple names, return initials (uppercase) of first two names.
  return nameParts
      .sublist(0, 2)
      .map((namePart) => namePart.substring(0, 1).toUpperCase())
      .join('');
}
