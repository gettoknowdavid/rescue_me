import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_list_tile.dart';
import '../../widgets/avatar.dart';
import 'notification_button_widget.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    if (viewModel.isBusy) return const Scaffold(body: LoadingWidget());

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(32, 50, 32, 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Avatar(
              radius: 60.r,
              imageUrl: viewModel.user.photoURL,
              name: viewModel.user.name,
            ),
            14.verticalSpace,
            Text(
              viewModel.user.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: context.profileNameStyle,
            ),
            24.verticalSpace,
            NotificationButtonWidget(onTap: viewModel.goToNotifications),
            16.verticalSpace,
            AppListTile(
              title: 'Edit Bio',
              icon: PhosphorIconsDuotone.user,
              onTap: viewModel.goToEditBio,
            ),
            const Divider(),
            AppListTile(
              title: 'Edit Email',
              icon: PhosphorIconsDuotone.envelope,
              onTap: viewModel.goToEditEmail,
              subtitle: viewModel.user.email,
            ),
            const Divider(),
            AppListTile(
              title: 'Change Password',
              icon: PhosphorIconsDuotone.key,
              onTap: viewModel.goToEditPassword,
            ),
            const Divider(),
            AppListTile(
              title: 'Update Phone Number',
              icon: PhosphorIconsDuotone.phone,
              onTap: viewModel.goToUpdatePhone,
            ),
            const Divider(),
            AppListTile(
              title: 'Logout',
              icon: PhosphorIconsDuotone.signOut,
              onTap: viewModel.logout,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(context) => ProfileViewModel();
}
