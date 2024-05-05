part of 'register_notifier.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    required IName name,
    required IEmail email,
    required IPassword password,
    required AsyncValue? result,
  }) = _RegisterState;

  factory RegisterState.initial() {
    return RegisterState(
      name: IName(''),
      email: IEmail(''),
      password: IPassword(''),
      result: null,
    );
  }
}
