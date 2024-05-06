import 'package:flutter/material.dart';

class GBackButton extends StatelessWidget {
  const GBackButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));

    final colors = Theme.of(context).colorScheme;

    return IconButton.filled(
      icon: const BackButtonIcon(),
      style: IconButton.styleFrom(
        foregroundColor: foregroundColor ?? colors.onBackground,
        backgroundColor: backgroundColor ?? colors.background,
        visualDensity: VisualDensity.standard,
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
