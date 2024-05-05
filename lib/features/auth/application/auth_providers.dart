import 'package:gromuse/config/config.dart';
import 'package:gromuse/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
IAuthFacade auth(AuthRef ref) => di<IAuthFacade>();

@riverpod
String authError(AuthErrorRef ref, AuthException exception) {
  return exception.map(
    message: (error) => error.message,
    invalidEmailOrPassword: (_) => 'Invalid email or password. Try again',
    unableToVerifyEmail: (_) => 'Unable to verify your email address',
    emailAlreadyInUse: (_) => 'This email address is already in use. ',
    serverError: (_) => 'Server Error',
    unknownError: (_) => 'Unknown Error',
    timeOutError: (_) => 'The server timed out',
    networkError: (_) => 'Network Error',
    userTokenExpired: (_) => 'The user authentication token has expired',
  );
}
