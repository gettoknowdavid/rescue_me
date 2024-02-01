import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../common/widget_size.dart';

export '../common/widget_size.dart';

class LoadingWidget extends StatelessWidget {
  final WidgetSize size;
  final WidgetType type;

  const LoadingWidget({
    super.key,
    this.type = WidgetType.dots,
    this.size = WidgetSize.small,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: getDimension(),
        child: switch (type) {
          WidgetType.spinner => const CircularProgressIndicator(),
          WidgetType.dots => Lottie.asset('assets/animations/loading.json'),
        },
      ),
    );
  }

  double getDimension() => switch (size) {
        WidgetSize.small => 20.0.r,
        WidgetSize.medium => 28.0.r,
        WidgetSize.large => 36.0.r,
        WidgetSize.xLarge => 80.0.r,
        WidgetSize.xxLarge => 100.0.r,
      };
}

enum WidgetType { spinner, dots }
