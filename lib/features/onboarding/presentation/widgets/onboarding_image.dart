import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/config/config.dart';

class OnboardingImage extends StatelessWidget {
  final double imageHeight;

  const OnboardingImage({super.key, required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      width: 1.sw,
      color: GColors.onboarding,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
      child: Assets.images.onboarding.image(),
    );
  }
}
