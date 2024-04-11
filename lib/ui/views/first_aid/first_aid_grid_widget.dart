import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/widgets/skeleton.dart';
import 'package:stacked/stacked.dart';

import 'first_aid_viewmodel.dart';
import 'first_aid_widget.dart';

class FirstAidGridWidget extends ViewModelWidget<FirstAidViewModel> {
  const FirstAidGridWidget({super.key});

  @override
  Widget build(BuildContext context, FirstAidViewModel viewModel) {
    if (viewModel.isBusy || !viewModel.dataReady) {
      return const FirstAidGridSkeleton();
    }

    if (!viewModel.isBusy && viewModel.dataReady && viewModel.data!.isEmpty) {
      return const Center(child: Text('Nothing to see here'));
    }

    final list = viewModel.data!;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 16.r,
        mainAxisSpacing: 16.r,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) => FirstAidWidget(firstAid: list[i]),
    );
  }
}

class FirstAidGridSkeleton extends StatelessWidget {
  const FirstAidGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 16.r,
        mainAxisSpacing: 16.r,
      ),
      itemCount: 8,
      itemBuilder: (context, i) => Skeleton(
        loading: true,
        startColor: colorScheme.surface,
        endColor: colorScheme.surfaceVariant.withOpacity(0.8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(cornerRadius: 24.r, cornerSmoothing: 1),
            ),
          ),
        ),
      ),
    );
  }
}
