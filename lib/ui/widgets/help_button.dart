import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../common/app_colors.dart';

class HelpButton extends StatelessWidget {
  final double? radius;
  final VoidCallback onTap;

  const HelpButton({super.key, this.radius, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = radius ?? 100.0;
    final dimension = effectiveRadius * 2;

    return SizedBox(
      height: dimension,
      width: dimension,
      child: NeumorphicButton(
        onPressed: onTap,
        padding: EdgeInsets.all(dimension * 0.1).r,
        style: const NeumorphicStyle(
          color: kcRed2,
          lightSource: LightSource.top,
          shadowLightColor: Colors.black87,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        child: Neumorphic(
          style: const NeumorphicStyle(
            shape: NeumorphicShape.concave,
            color: kcLightGrey,
            boxShape: NeumorphicBoxShape.circle(),
            lightSource: LightSource.top,
            shadowLightColor: Colors.black54,
            shadowDarkColor: Colors.black38,
            intensity: 70,
            surfaceIntensity: 70,
            shadowDarkColorEmboss: kcBlack,
          ),
          child: Center(
            child: NeumorphicIcon(
              PhosphorIcons.asterisk(PhosphorIconsStyle.bold),
              size: dimension * 0.5,
              style: const NeumorphicStyle(
                shape: NeumorphicShape.concave,
                color: kcBlack,
                lightSource: LightSource.top,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
