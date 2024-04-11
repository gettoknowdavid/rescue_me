import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.7.sw,
      width: 0.7.sw,
      padding: const EdgeInsets.all(16).r,
      alignment: Alignment.center,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Coming Soon!',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            5.verticalSpace,
            Text(
              'This feature is an upcoming feature. Stay tuned for more updates.',
              textAlign: TextAlign.center,
              style: context.subtitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
