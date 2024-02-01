import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../common/app_colors.dart';

class HelpButton extends StatelessWidget {
  final double? radius;

  const HelpButton({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = radius ?? 100.0;
    final dimension = effectiveRadius * 2;

    return SizedBox(
      height: dimension,
      width: dimension,
      child: Neumorphic(
        padding: const EdgeInsets.all(20),
        style: const NeumorphicStyle(
          color: kcRed1,
          lightSource: LightSource.top,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        child: Neumorphic(
          style: const NeumorphicStyle(
            shape: NeumorphicShape.concave,
            color: kcLightGrey,
            boxShape: NeumorphicBoxShape.circle(),
            lightSource: LightSource.top,
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
