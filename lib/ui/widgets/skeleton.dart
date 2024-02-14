import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:stacked/stacked.dart';

class Skeleton extends StatelessWidget {
  final bool loading;
  final Widget child;
  const Skeleton({super.key, required this.loading, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SkeletonLoader(
      loading: loading,
      startColor: colorScheme.background,
      endColor: colorScheme.inversePrimary,
      child: child,
    );
  }
}
