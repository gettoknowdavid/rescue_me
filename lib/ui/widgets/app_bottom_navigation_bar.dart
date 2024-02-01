import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/views/layout/layout_viewmodel.dart';
import 'package:stacked/stacked.dart';

const items = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(PhosphorIconsLight.houseSimple),
    activeIcon: Icon(PhosphorIconsFill.houseSimple),
  ),
  BottomNavigationBarItem(
    label: 'SOS',
    icon: Icon(PhosphorIconsLight.firstAid),
    activeIcon: Icon(PhosphorIconsFill.firstAid),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    icon: Icon(PhosphorIconsLight.userCircle),
    activeIcon: Icon(PhosphorIconsFill.userCircle),
  ),
];

class AppBottomNavigationBar extends ViewModelWidget<LayoutViewModel> {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, LayoutViewModel viewModel) {
    return BottomNavigationBar(
      currentIndex: viewModel.currentIndex,
      onTap: viewModel.handleNavigation,
      items: items,
    );
  }
}
