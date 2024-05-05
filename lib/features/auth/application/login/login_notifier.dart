import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gromuse/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/onboarding.dart';
import '../auth_providers.dart';

part 'login_notifier.freezed.dart';
part 'login_notifier.g.dart';
part 'login_state.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() => LoginState.initial();

  bool get isFormValid => state.email.isValid() && state.password.isValid();

  void onEmailChanged(String email) {
    state = state.copyWith(
      email: IEmail(email),
      result: null,
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: IPassword(password, isLogin: true),
      result: null,
    );
  }

  Future<void> login() async {
    state = state.copyWith(result: const AsyncLoading());

    final result = await ref
        .read(authProvider)
        .login(email: state.email, password: state.password);

    state = state.copyWith(
      result: result.fold(
        (l) => AsyncError(ref.read(authErrorProvider(l)), StackTrace.current),
        (r) {
          ref.read(completeOnboardingProvider);
          return AsyncData(r);
        },
      ),
    );
  }
}
