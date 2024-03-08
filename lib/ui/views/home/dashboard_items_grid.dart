import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:rescue_me/ui/views/home/dashboard_item_widget.dart';
import 'package:rescue_me/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DashboardItemsGrid extends ViewModelWidget<HomeViewModel> {
  const DashboardItemsGrid({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 24.r,
        mainAxisSpacing: 24.r,
      ),
      itemCount: viewModel.items.length,
      itemBuilder: (context, index) => DashboardItemWidget(
        item: viewModel.items[index],
      ),
    );
  }
}
