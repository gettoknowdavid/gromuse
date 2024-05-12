import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/config/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GLocationWidget extends StatelessWidget {
  const GLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        90.verticalSpace,
        Text(
          'Current Location',
          style: GTextStyle.caption.copyWith(
            color: colors.onPrimary.withOpacity(0.5),
          ),
        ),
        4.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              PhosphorIconsRegular.navigationArrow,
              color: colors.secondary,
              size: 18.r,
            ),
            8.horizontalSpace,
            Text(
              'California, USA',
              style: GTextStyle.bodyBold.copyWith(color: colors.secondary),
            ),
          ],
        ),
      ],
    );
  }
}
