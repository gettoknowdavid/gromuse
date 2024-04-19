import 'package:flutter/material.dart';
import 'package:gromuse/config/route/router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Onboarding'),
          onPressed: () => const HomeRoute().go(context),
        ),
      ),
    );
  }
}
