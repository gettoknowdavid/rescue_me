import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/user.dart';

final smoothRectangleBorder = SmoothRectangleBorder(
  borderRadius: SmoothBorderRadius(
    cornerRadius: 12.r,
    cornerSmoothing: 1,
  ),
);

IconData getIcon(EmergencyContactType type) => switch (type) {
      EmergencyContactType.police => PhosphorIconsDuotone.policeCar,
      EmergencyContactType.ambulance => PhosphorIconsDuotone.star,
      EmergencyContactType.fire => PhosphorIconsDuotone.fire,
      EmergencyContactType.personal => PhosphorIconsDuotone.asterisk,
    };

class SosContactItem extends StatelessWidget {
  const SosContactItem({super.key, required this.contact});

  final EmergencyContact contact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final size = 60.r;

    final isPersonal = contact.type == EmergencyContactType.personal;

    DecorationImage? image;
    final url = contact.imageUrl;

    if (isPersonal && url != null) {
      image = DecorationImage(image: NetworkImage(url), fit: BoxFit.cover);
    }

    return InkWell(
      onTap: () {},
      borderRadius: smoothRectangleBorder.borderRadius,
      child: Container(
        height: size,
        width: size,
        decoration: ShapeDecoration(
          color: colorScheme.surfaceVariant,
          shape: smoothRectangleBorder,
          image: image,
        ),
        child: !isPersonal ? PhosphorIcon(getIcon(contact.type)) : null,
      ),
    );
  }
}
