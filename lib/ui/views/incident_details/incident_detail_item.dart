import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentDetailItem extends StatelessWidget {
  final IconData icon;
  final Color? iconColor, onIconColor;
  final String title;
  final String? subtitle;
  final String? label;
  final void Function()? onTap;

  const IncidentDetailItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.label,
    this.onTap,
    this.iconColor,
    this.onIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 40.r,
            width: 40.r,
            decoration: BoxDecoration(
              color: iconColor ?? theme.primaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(14)),
            ),
            child: Icon(
              icon,
              color: onIconColor ?? theme.iconTheme.color?.withOpacity(0.5),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label != null)
                  Text(
                    label!,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium,
                ),
                if (subtitle != null)
                  Text(subtitle!, style: textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
