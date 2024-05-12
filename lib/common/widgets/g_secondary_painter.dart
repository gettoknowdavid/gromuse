import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GSecondaryPainter extends CustomPainter {
  final Color color;
  GSecondaryPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final curve = 50.0.r;

    final path = Path();
    path
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width / 2, -curve, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
