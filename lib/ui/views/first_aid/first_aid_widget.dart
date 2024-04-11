import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../models/first_aid.dart';
import 'first_aid_viewmodel.dart';

final _smoothBorderRadius = SmoothBorderRadius.all(
  SmoothRadius(cornerRadius: 24.r, cornerSmoothing: 1),
);

class FirstAidWidget extends ViewModelWidget<FirstAidViewModel> {
  const FirstAidWidget({super.key, required this.firstAid});
  final FirstAid firstAid;

  @override
  Widget build(BuildContext context, FirstAidViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.showDetails(firstAid),
      borderRadius: _smoothBorderRadius,
      child: Container(
        padding: const EdgeInsets.all(12).r,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
          borderRadius: _smoothBorderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              firstAid.featuredImageURL,
              color: Theme.of(context).colorScheme.primary,
              height: 50.r,
              width: 50.r,
            ),
            8.verticalSpace,
            Text(
              firstAid.title,
              style: context.fieldLabel?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
