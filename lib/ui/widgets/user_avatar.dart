import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

import '../views/layout/layout_viewmodel.dart';

class UserAvatar extends ViewModelWidget<LayoutViewModel> {
  final double radius;

  const UserAvatar({super.key, this.radius = 20});

  @override
  Widget build(BuildContext context, LayoutViewModel viewModel) {
    final hasPhoto = viewModel.hasPhoto;

    final badgeSize = 5.0.r;
    final boxSize = (radius * 2) + (badgeSize / 2);

    return InkWell(
      onTap: () => viewModel.handleNavigation(1),
      child: SizedBox(
        height: boxSize.r,
        width: boxSize.r,
        child: Stack(
          children: [
            CircleAvatar(
              radius: radius.r,
              foregroundImage:
                  hasPhoto ? NetworkImage(viewModel.photoURL!) : null,
              child: !hasPhoto
                  ? PhosphorIcon(PhosphorIconsDuotone.user, size: radius.r)
                  : null,
            ),
            StreamBuilder<bool>(
              stream: viewModel.hasNotifications,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == true) {
                  return Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: badgeSize,
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
