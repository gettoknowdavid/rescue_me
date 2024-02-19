import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12).r,
        suffixIcon: Icon(PhosphorIconsBold.magnifyingGlass, size: 16.r),
        suffixIconColor: colorScheme.onSurface.withOpacity(0.5),
        hintText: 'Search',
        hintStyle: theme.inputDecorationTheme.hintStyle?.copyWith(
          fontSize: 14.r,
        ),
      ),
    );
  }
}
