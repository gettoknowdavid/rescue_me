import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/common/app_styles.dart';

import 'skeleton.dart';

class AppListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final IconData? icon;
  final Widget? trailing;

  const AppListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.primary.withOpacity(0.85);

    return ListTile(
      leading: icon != null
          ? PhosphorIcon(icon!, size: 18.r, color: iconColor)
          : null,
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: subtitle != null
          ? Text(subtitle!, style: context.subtitleStyle)
          : null,
      visualDensity: VisualDensity.comfortable,
      onTap: onTap,
      trailing: trailing,
    );
  }
}


class AppListTileSkeleton extends StatelessWidget {
  final bool loading;
  const AppListTileSkeleton({super.key, this.loading = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Skeleton(loading: loading, child: CircleAvatar(radius: 9.r)),
      contentPadding: EdgeInsets.zero,
      title: Skeleton(loading: loading, child: SizedBox(height: 14.r)),
      subtitle: Skeleton(
        loading: loading,
        child: SizedBox(height: 11.r, width: 100.r),
      ),
    );
  }
}
