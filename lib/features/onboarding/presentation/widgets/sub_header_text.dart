import 'package:flutter/material.dart';
import 'package:gromuse/config/config.dart';

class SubHeaderText extends StatelessWidget {
  const SubHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome to Gromuse, your ultimate mobile application for hassle-free grocery shopping.',
      textAlign: TextAlign.center,
      style: GTextStyle.bodySmall,
    );
  }
}
