import 'package:flutter/material.dart';

import 'loading_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.label,
    this.disabled = false,
    this.loading = false,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool disabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: disabled ? null : onPressed,
      child:
          loading ? const LoadingWidget(type: WidgetType.spinner) : Text(label),
    );
  }
}
