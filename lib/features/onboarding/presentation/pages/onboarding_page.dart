import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/common/widgets/secondary_button.dart';
import 'package:gromuse/config/config.dart';

import '../widgets/widgets.dart';

final bottomContentHeight = 1.sh - imageHeight;
final imageHeight = 0.6.sh;

class OnboardingPage extends StatelessWidget with SU {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          OnboardingImage(imageHeight: imageHeight),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 1.sw,
              height: bottomContentHeight,
              child: CustomPaint(
                painter: GSecondaryPainter(colors.background),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Spacer(),
                      const HeaderText(),
                      10.verticalSpace,
                      const SubHeaderText(),
                      30.verticalSpace,
                      PrimaryButton(
                        label: 'Get Started',
                        onPressed: () => const RegisterRoute().push(context),
                      ),
                      8.verticalSpace,
                      SecondaryButton(
                        onPressed: () => const LoginRoute().push(context),
                        label: 'Login',
                      ),
                      30.verticalSpace,
                      const Spacer(),
                    ],
                  ),
                ),            
              ),
            ),
          ),
        ],
      ),
    );
  }
}
