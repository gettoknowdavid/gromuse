import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/features/auth/application/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../onboarding/onboarding.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            20.verticalSpace,
            TextButton.icon(
              icon: const Icon(PhosphorIconsBold.signOut),
              onPressed: ref.read(authNotifierProvider.notifier).signOut,
              label: const Text('Sign Out'),
            ),
            20.verticalSpace,
            TextButton(
              onPressed: () => ref.read(clearOnboardingProvider),
              child: const Text('Clear Onboarding'),
            ),
          ],
        ),
      ),
    );
  }
}
