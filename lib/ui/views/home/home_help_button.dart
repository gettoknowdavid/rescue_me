import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:rescue_me/ui/common/app_colors.dart';
import 'package:rescue_me/ui/widgets/help_button.dart';

class HomeHelpButton extends StatelessWidget {
  final VoidCallback onTap;
  const HomeHelpButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(12).r,
      decoration: ShapeDecoration(
        color: kcRed2,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 20.r,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Need help?',
                  style: textTheme.bodyLarge?.copyWith(color: kcWhite),
                ),
                2.verticalSpace,
                Text(
                  'Press and hold the button for 3 seconds to call for immediate help (do not hesitate to call)',
                  style: textTheme.bodySmall?.copyWith(
                    letterSpacing: 0,
                    fontSize: 12.sp,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          20.horizontalSpace,
          HelpButton(radius: 46.r, onTap: onTap),
        ],
      ),
    );
  }
}
