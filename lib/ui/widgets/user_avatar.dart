import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/views/layout/layout_viewmodel.dart';
import 'package:stacked/stacked.dart';

class UserAvatar extends ViewModelWidget<LayoutViewModel> {
  final double radius;

  const UserAvatar({super.key, this.radius = 20});

  @override
  Widget build(BuildContext context, LayoutViewModel viewModel) {
    final hasPhoto = viewModel.hasPhoto;
    return InkWell(
      onTap: () => viewModel.handleNavigation(2),
      child: CircleAvatar(
        radius: radius.r,
        foregroundImage: hasPhoto ? NetworkImage(viewModel.photoURL!) : null,
        child: !hasPhoto
            ? PhosphorIcon(PhosphorIconsDuotone.user, size: radius.r)
            : null,
      ),
    );
  }
}
