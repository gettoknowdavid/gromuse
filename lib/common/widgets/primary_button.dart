import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
    return FilledButton(
      onPressed: disabled || loading ? null : onPressed,
      child: loading ? const LoadingIndicator() : Text(label),
    );
  }
}

