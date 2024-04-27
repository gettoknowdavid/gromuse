import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/config/config.dart';

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
    final isEnabled = !disabled || !loading;

    return FilledButton(
      onPressed: isEnabled ? onPressed : null,
      child: loading ? const _LoadingIndicator() : Text(label),
    );
  }
}

class _LoadingIndicator extends StatelessWidget with SU {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    final buttonSize = GTheme.filledButtonSize;
    final containerHeight = buttonSize.height * 0.8;

    return SizedBox(
      height: containerHeight.r,
      width: containerHeight.r,
      child: const CircularProgressIndicator(),
    );
  }
}
