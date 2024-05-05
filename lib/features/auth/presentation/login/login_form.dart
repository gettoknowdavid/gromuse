import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/config/config.dart';
import 'package:gromuse/features/auth/application/application.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Login', style: GTextStyle.display),
        10.verticalSpace,
        const _Email(),
        10.verticalSpace,
        const _Password(),
        20.verticalSpace,
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

    return TextFormField(
      enabled: !isLoading,
      keyboardType: TextInputType.emailAddress,
      onChanged: ref.read(loginNotifierProvider.notifier).onEmailChanged,
      decoration: const InputDecoration(hintText: 'Email'),
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

    return TextFormField(
      obscureText: true,
      enabled: !isLoading,
      onChanged: ref.read(loginNotifierProvider.notifier).onPasswordChanged,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }
}
