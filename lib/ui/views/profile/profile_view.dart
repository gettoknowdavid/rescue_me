import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/widgets/avatar.dart';
import 'package:stacked/stacked.dart';

import 'profile_option_tile.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(32, 60, 32, 16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Avatar(
              radius: 60.r,
              imageUrl: viewModel.user.photoURL,
              name: viewModel.user.displayName,
            ),
            20.verticalSpace,
            Text(
              viewModel.user.displayName!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18.r,
              ),
            ),
            6.verticalSpace,
            Text(
              viewModel.user.email!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
            30.verticalSpace,
            ProfileOptionTile(
              title: 'Edit Bio',
              icon: PhosphorIconsDuotone.user,
              onTap: viewModel.goToEditBio,
            ),
            const Divider(),
            ProfileOptionTile(
              title: 'Edit Email',
              icon: PhosphorIconsDuotone.envelope,
              onTap: viewModel.goToEditEmail,
            ),
            const Divider(),
            ProfileOptionTile(
              title: 'Change Password',
              icon: PhosphorIconsDuotone.key,
              onTap: viewModel.goToEditPassword,
            ),
            const Divider(),
            const ProfileOptionTile(
              title: 'Privacy & Policy',
              icon: PhosphorIconsDuotone.note,
            ),
            const Divider(),
            ProfileOptionTile(
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
