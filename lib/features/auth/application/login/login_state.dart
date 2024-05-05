part of 'login_notifier.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required IEmail email,
    required IPassword password,
    required AsyncValue? result,
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      email: IEmail(''),
      password: IPassword('', isLogin: true),
      result: null,
    );
  }
}
