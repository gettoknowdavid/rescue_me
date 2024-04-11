import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:super_bullet_list/bullet_list.dart';

class BulletList extends StatelessWidget {
  const BulletList({super.key, required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.firstAidItemTitle;
    final itemsStyle = context.firstAidSubtitle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: titleStyle),
        5.verticalSpace,
        SuperBulletList(
          items: items.map((e) => Text(e, style: itemsStyle)).toList(),
          gap: 8.r,
          crossAxisMargin: 0.r,
          separator: 4.verticalSpace,
          customBullet: Padding(
            padding: const EdgeInsets.only(left: 4.0).r,
            child: const Text('-'),
          ),
        ),
      ],
    );
  }
}
