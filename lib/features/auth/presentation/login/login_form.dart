import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/features/auth/application/application.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Email(),
        20.verticalSpace,
        const _Password(),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text('Forgot Password?'),
          ),
        ),
        30.verticalSpace,
        const _LoginButton(),
      ],
    );
  }
}

class _Email extends ConsumerWidget {
  const _Email();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginNotifierProvider);
    final isLoading = state.result?.isLoading == true;

    return GTextFormField(
      enabled: !isLoading,
      keyboardType: TextInputType.emailAddress,
      onChanged: ref.read(loginNotifierProvider.notifier).onEmailChanged,
      label: 'Email',
      hint: 'Email',
      prefixIcon: PhosphorIconsBold.user,
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginNotifierProvider.notifier);
    final isLoading = ref.watch(loginNotifierProvider).result?.isLoading;

    return PrimaryButton(
      label: 'Login',
      loading: isLoading == true,
      disabled: isLoading == true || !notifier.isFormValid,
      onPressed: notifier.login,
    );
  }
}

class _Password extends ConsumerWidget {
  const _Password();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginNotifierProvider);
    final isLoading = state.result?.isLoading == true;

    return GTextFormField(
      isPassword: true,
      enabled: !isLoading,
      onChanged: ref.read(loginNotifierProvider.notifier).onPasswordChanged,
      label: 'Password',
      hint: 'Password',
      prefixIcon: PhosphorIconsBold.lock,
    );
  }
}
