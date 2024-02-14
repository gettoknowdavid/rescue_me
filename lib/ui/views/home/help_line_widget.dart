import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:rescue_me/models/help_line.dart';

import '../../widgets/skeleton.dart';

final _smoothRectangleBorder = SmoothRectangleBorder(
  borderRadius: SmoothBorderRadius(
    cornerRadius: 12.r,
    cornerSmoothing: 1,
  ),
);

class HelpLineWidget extends StatelessWidget {
  final HelpLine? item;

  const HelpLineWidget({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    final loading = item == null;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final height = 50.h;
    final width = 180.w;

    return InkWell(
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8).r,
        decoration: ShapeDecoration(
          color: colorScheme.surfaceVariant,
          shape: _smoothRectangleBorder,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Skeleton(
              loading: loading,
              child: Container(
                height: 42.r,
                width: 42.r,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: colorScheme.surface,
                  shape: _smoothRectangleBorder,
                ),
                child: item?.imageUrl == null
                    ? null
                    : Image.network(
                        item!.imageUrl!,
                        color: colorScheme.onSurface.withOpacity(0.6),
                        height: 26.r,
                        width: 26.r,
                      ),
              ),
            ),
            8.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(
                    loading: loading,
                    child: loading
                        ? SizedBox(height: 12.r, width: width)
                        : Text(
                            item!.title,
                            maxLines: 1,
                            style: textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                  ),
                  2.verticalSpace,
                  Skeleton(
                    loading: loading,
                    child: loading
                        ? SizedBox(height: 10.r, width: 60.w)
                        : Text(
                            item?.subtitle ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                textTheme.bodySmall?.copyWith(fontSize: 10.r),
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
