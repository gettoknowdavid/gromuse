import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
class AuthException with _$AuthException {
  const factory AuthException.message(String message) = _Message;
  const factory AuthException.invalidEmailOrPassword() = _InvalidEmailOrPassword;
  const factory AuthException.unableToVerifyEmail() = _UnableToVerifyEmail;
  const factory AuthException.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthException.serverError() = _ServerError;
  const factory AuthException.unknownError() = _UnknownError;
  const factory AuthException.timeOutError() = _TimeOutError;
  const factory AuthException.networkError() = _NetworkError;
  const factory AuthException.userTokenExpired() = _UserTokenExpired;
}