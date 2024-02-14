import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? action;
  final bool showAction;
  final bool addPadding;

  const SectionTitle(
    this.title, {
    super.key,
    this.action,
    this.showAction = true,
    this.addPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: addPadding
          ? const EdgeInsets.symmetric(horizontal: 16).r
          : EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(child: Text(title, style: textTheme.titleMedium)),
          if (showAction)
            GestureDetector(
              onTap: action,
              child: Text('See all', style: textTheme.labelMedium),
            ),
        ],
      ),
    );
  }
}
