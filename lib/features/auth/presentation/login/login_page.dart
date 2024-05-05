import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/config/config.dart';
import 'package:gromuse/features/auth/application/application.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_form.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    ref.listen(loginNotifierProvider, (previous, next) {
      next.result?.whenOrNull(
        error: (error, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error as String,
              style: GTextStyle.caption.copyWith(color: colors.onError),
            ),
            backgroundColor: colors.error,
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: const LoginForm(),
      ),
    );
  }
}
