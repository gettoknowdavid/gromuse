import 'package:flutter/material.dart';
import 'package:gromuse/common/common.dart';

class GClippedContainer extends StatelessWidget {
  const GClippedContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.margin,
    this.contentPadding,
    this.backgroundColor,
  });

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: height,
      width: width,
      margin: margin,
      child: CustomPaint(
        painter: GSecondaryPainter(backgroundColor ?? colors.background),
        child: Padding(
          padding: contentPadding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
