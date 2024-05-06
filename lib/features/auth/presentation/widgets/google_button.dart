import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Assets.images.googleLogo.image(
        height: 18.r,
        width: 18.r,
      ),
      label: const Text('Sign in with Google'),
    );
  }
}
