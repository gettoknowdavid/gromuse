import 'package:dartz/dartz.dart';

import '../../../../common/value_objects/value_objects.dart';
import 'validators.dart';

/// A typedef representing the result of validating a password.
typedef IPasswordResult = Either<ValueFailure<String>, String>;

/// Represents a password of a Meno user
class IPassword extends ValueObject<String> {
  /// The password, validated or not.
  @override
  final IPasswordResult value;

  /// Whether the password is for signing in or signing up.
  final bool isLogin;

  /// Creates a new `IPassword` object.
  factory IPassword(String input, {bool isLogin = false}) {
    if (isLogin) {
      return IPassword._(validateNotEmpty(input.trim()), isLogin: isLogin);
    } else {
      return IPassword._(validatePassword(input.trim()), isLogin: isLogin);
    }
  }

  /// Creates a new `IPassword` object with the specified value and isLogin flag.
  const IPassword._(this.value, {this.isLogin = false});
}
