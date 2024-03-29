import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppListTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final IconData icon;
  final Widget? trailing;

  const AppListTile({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.primary.withOpacity(0.85);

    return ListTile(
      leading: PhosphorIcon(icon, size: 18.r, color: iconColor),
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      visualDensity: VisualDensity.comfortable,
      onTap: onTap,
      trailing: trailing,
    );
  }
}
