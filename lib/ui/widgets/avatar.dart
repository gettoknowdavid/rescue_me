import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final double radius;
  final VoidCallback? onTap;

  const Avatar({
    super.key,
    this.radius = 16.0,
    this.imageUrl,
    this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget placeholder = Icon(PhosphorIconsDuotone.user, size: radius.r);

    if (imageUrl == null && name != null) {
      placeholder = Text(name!.toUpperCase());
    }

    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius.r,
        foregroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        child: placeholder,
      ),
    );
  }
}
