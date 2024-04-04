import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/views/layout/layout_viewmodel.dart';
import 'package:stacked/stacked.dart';

const _icons = [
  PhosphorIconsLight.houseSimple,
  PhosphorIconsLight.userCircle,
  PhosphorIconsLight.gear,
];

class AppBottomNavigationBar extends ViewModelWidget<LayoutViewModel> {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, LayoutViewModel viewModel) {
    final theme = Theme.of(context).bottomNavigationBarTheme;

    return AnimatedBottomNavigationBar(
      icons: _icons,
      activeIndex: viewModel.currentIndex,
      onTap: viewModel.handleNavigation,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.sharpEdge,
      notchMargin: 0,
      activeColor: theme.selectedItemColor,
      inactiveColor: theme.unselectedItemColor,
      iconSize: theme.selectedIconTheme?.size,
      backgroundColor: theme.backgroundColor,
    );
  }
}
