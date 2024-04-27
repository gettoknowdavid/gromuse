import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final handleSize = Size(32.w, 4.h);

    return SizedBox(
      width: kMinInteractiveDimension,
      child: Center(
        child: Container(
          height: handleSize.height,
          width: handleSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(handleSize.height / 2),
            color: colors.onSurfaceVariant.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
