import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return IconButton.filled(
      icon: const PhosphorIcon(PhosphorIconsDuotone.shoppingCart),
      onPressed: () {},
      style: IconButton.styleFrom(
        backgroundColor: colors.onPrimary,
        foregroundColor: colors.primary,
        maximumSize: Size(40.h, 40.h),
        minimumSize: Size(40.h, 40.h),
        fixedSize: Size(40.h, 40.h),
      ),
    );
  }
}
