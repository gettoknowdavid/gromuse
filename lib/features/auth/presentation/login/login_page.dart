import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/common/widgets/widgets.dart';
import 'package:gromuse/config/config.dart';
import 'package:gromuse/features/auth/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/widgets.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthTitleContainer(
              title: 'Welcome back!',
              subtitle:
                  'We have missed you. You can login with your credentials.',
            ),
            CurvedContainer(
              contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16).r,
              child: Column(
                children: [
                  const DragHandle(),
                  30.verticalSpace,
                  const LoginForm(),
                  16.verticalSpace,
                  const OrDivider(),
                  20.verticalSpace,
                  const GoogleButton(),
                  10.verticalSpace,
                  RedirectionTextButton(
                    title: 'Don\'t have an account yet?',
                    buttonLabel: 'Register now',
                    onTap: () => const RegisterRoute().push(context),
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
