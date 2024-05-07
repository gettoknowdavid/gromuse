import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, this.isRegister = false});

  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    final label = isRegister ? 'Sign up with Google' : 'Sign in with Google';
    return ElevatedButton.icon(
      label: Text(label),
      icon: Assets.images.googleLogo.image(height: 18.r, width: 18.r),
      onPressed: () {},
    );
  }
}
