import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gromuse/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/onboarding.dart';
import '../auth_providers.dart';

part 'register_notifier.freezed.dart';
part 'register_notifier.g.dart';
part 'register_state.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() => RegisterState.initial();

  bool get isFormValid {
    return state.email.isValid() &&
        state.email.isValid() &&
        state.password.isValid();
  }

  void onNameChanged(String name) {
    state = state.copyWith(
      name: IName(name),
      result: null,
    );
  }

  void onEmailChanged(String email) {
    state = state.copyWith(
      email: IEmail(email),
      result: null,
    );
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(
      password: IPassword(password),
      result: null,
    );
  }

  Future<void> register() async {
    state = state.copyWith(result: const AsyncLoading());

    final result = await ref.read(authProvider).register(
        name: state.name, email: state.email, password: state.password);

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
