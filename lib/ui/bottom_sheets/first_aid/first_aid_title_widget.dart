import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/models/first_aid.dart';
import 'package:rescue_me/ui/common/app_styles.dart';

class FirstAidTitleWidget extends StatelessWidget {
  const FirstAidTitleWidget({super.key, required this.firstAid});

  final FirstAid firstAid;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 40.r,
          width: 40.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withOpacity(0.2),
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(cornerRadius: 12.r, cornerSmoothing: 1),
            ),
          ),
          child: Image.network(
            firstAid.featuredImageURL,
            color: colorScheme.primary,
            height: 26.r,
            width: 26.r,
          ),
        ),
        10.horizontalSpace,
        Text(firstAid.title, style: context.firstAidTitle),
      ],
    );
  }
}
