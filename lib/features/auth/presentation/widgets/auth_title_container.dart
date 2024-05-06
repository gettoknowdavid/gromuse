import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/config/config.dart';

class AuthTitleContainer extends StatelessWidget {
  const AuthTitleContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      color: colors.primary,
      height: 0.28.sh,
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            leading:
                context.canPop() ? const Center(child: GBackButton()) : null,
            leadingWidth: 40.w,
            backgroundColor: colors.primary,
          ),
          if (context.canPop()) 8.verticalSpace,
          Text(
            title,
            style: GTextStyle.display.copyWith(color: colors.onPrimary),
          ),
          4.verticalSpace,
          Text(
            subtitle,
            style: GTextStyle.bodySmall.copyWith(
              color: colors.onPrimary.withOpacity(0.8),
              height: 1.2.h,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
