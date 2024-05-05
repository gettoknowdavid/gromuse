import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gromuse/common/common.dart';
import 'package:gromuse/config/config.dart';
import 'package:gromuse/features/auth/application/register/register_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    ref.listen(registerNotifierProvider, (previous, next) {
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
        child: Column(
          children: [
            const Text('Register', style: GTextStyle.display),
            10.verticalSpace,
            const _Name(),
            10.verticalSpace,
            const _Email(),
            10.verticalSpace,
            const _Password(),
            20.verticalSpace,
            const _RegisterButton(),
          ],
        ),
      ),
    );
  }
}

class _Name extends ConsumerWidget {
  const _Name();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerNotifierProvider);
    final isLoading = state.result?.isLoading == true;

    return TextFormField(
      enabled: !isLoading,
      onChanged: ref.read(registerNotifierProvider.notifier).onNameChanged,
      decoration: const InputDecoration(hintText: 'Name'),
    );
  }
}

class _Email extends ConsumerWidget {
  const _Email();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerNotifierProvider);
    final isLoading = state.result?.isLoading == true;

    return TextFormField(
      enabled: !isLoading,
      keyboardType: TextInputType.emailAddress,
      onChanged: ref.read(registerNotifierProvider.notifier).onEmailChanged,
      decoration: const InputDecoration(hintText: 'Email'),
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

    return TextFormField(
      obscureText: true,
      enabled: !isLoading,
      onChanged: ref.read(registerNotifierProvider.notifier).onPasswordChanged,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }
}
