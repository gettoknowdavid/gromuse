import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/config/config.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GSearchBox extends StatelessWidget {
  const GSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SearchBar(
        elevation: Internal.all(0),
        constraints: BoxConstraints(minHeight: 40.h, maxHeight: 40.h),
        leading: const PhosphorIcon(PhosphorIconsDuotone.magnifyingGlass),
        hintText: 'Search for "Grocery"',
        padding: Internal.all(const EdgeInsets.symmetric(horizontal: 12).r),
      ),
    );
  }
}
