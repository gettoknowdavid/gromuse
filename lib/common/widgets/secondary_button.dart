import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.disabled = false,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool disabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: disabled || loading ? null : onPressed,
      child: loading ? const LoadingIndicator() : Text(label),
    );
  }
}
