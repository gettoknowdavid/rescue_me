import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/widgets/app_list_tile.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
        titleTextStyle: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18.r,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16).r,
        child: Column(
          children: [
            AppListTile(
              title: 'Dark Mode',
              icon: PhosphorIconsDuotone.moon,
              trailing: Switch(
                value: isDark,
                onChanged: (value) => viewModel.onThemeChanged(value, context),
              ),
            ),
            const Divider(),
            AppListTile(
              title: 'About RescueMe',
              icon: PhosphorIconsDuotone.info,
              onTap: viewModel.goToAbout,
            ),
            const Divider(),
            AppListTile(
              title: 'Help & Support',
              icon: PhosphorIconsDuotone.question,
              onTap: viewModel.goToHelpSupport,
            ),
          ],
        ),
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(context) => SettingsViewModel();
}
