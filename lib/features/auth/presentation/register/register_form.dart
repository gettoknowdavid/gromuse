import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/features/auth/application/application.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Name(),
        20.verticalSpace,
        const _Email(),
        20.verticalSpace,
        const _Password(),
        30.verticalSpace,
        const _RegisterButton(),
      ],
    );
  }
}

class _Name extends ConsumerWidget {
  const _Name();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerNotifierProvider);
    final isLoading = state.result?.isLoading == true;

    return GTextFormField(
      label: 'Name',
      hint: 'Name',
      enabled: !isLoading,
      prefixIcon: PhosphorIconsBold.user,
      onChanged: ref.read(registerNotifierProvider.notifier).onNameChanged,
    );
  }
}

class _Email extends ConsumerWidget {
  const _Email();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerNotifierProvider);
    final isLoading = state.result?.isLoading == true;

    return GTextFormField(
      label: 'Email',
      hint: 'Email',
      enabled: !isLoading,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: PhosphorIconsBold.at,
      onChanged: ref.read(registerNotifierProvider.notifier).onEmailChanged,
    );
  }
}

class _RegisterButton extends ConsumerWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registerNotifierProvider.notifier);
    final isLoading = ref.watch(registerNotifierProvider).result?.isLoading;

    return PrimaryButton(
      label: 'Register',
      loading: isLoading == true,
      disabled: isLoading == true || !notifier.isFormValid,
      onPressed: notifier.register,
    );
  }
}

class _Password extends ConsumerWidget {
  const _Password();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerNotifierProvider);
    final isLoading = state.result?.isLoading == true;

    return GTextFormField(
      label: 'Password',
      hint: 'Password',
      isPassword: true,
      enabled: !isLoading,
      prefixIcon: PhosphorIconsBold.lock,
      onChanged: ref.read(registerNotifierProvider.notifier).onPasswordChanged,
    );
  }
}
