import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:rescue_me/ui/views/home/help_line_widget.dart';
import 'package:rescue_me/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/section_title.dart';

class HelpLineList extends ViewModelWidget<HomeViewModel> {
  const HelpLineList({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    Widget child = _List(
      itemCount: 3,
      itemBuilder: (context, i) => const HelpLineWidget(),
    );

    if (viewModel.dataReady && viewModel.data!.isEmpty) {
      child = LimitedBox(
        maxHeight: 50.h,
        child: const Center(child: Text('Nothing to see here.')),
      );
    }

    if (viewModel.dataReady && viewModel.data!.isNotEmpty) {
      child = _List(
        itemCount: viewModel.data!.length,
        itemBuilder: (context, i) => HelpLineWidget(
          item: viewModel.data![i]!,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle('Emergency Helplines', addPadding: true),
        child,
      ],
    );
  }
}

class _List extends ViewModelWidget<HomeViewModel> {
  final NullableIndexedWidgetBuilder itemBuilder;
  final int itemCount;

  const _List({required this.itemBuilder, required this.itemCount});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return LimitedBox(
      maxHeight: 82.h,
      child: ListView.separated(
        separatorBuilder: (context, i) => 16.horizontalSpace,
        padding: const EdgeInsets.all(16).r,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        shrinkWrap: true,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
