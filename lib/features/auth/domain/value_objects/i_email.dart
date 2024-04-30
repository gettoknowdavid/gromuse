import 'package:dartz/dartz.dart';
import 'package:gromuse/common/value_objects/value_objects.dart';

import 'validators.dart';

/// A typedef representing the result of validating an email address.
typedef IEmailResult = Either<ValueFailure<String>, String>;

/// Represents an email address of a Meno user
class IEmail extends ValueObject<String> {
  /// The email address, validated or not.
  @override
  final IEmailResult value;

  /// Creates a new `IEmail` object.
  factory IEmail(String input) {
    final finalInput = input.toLowerCase().trim();
    return IEmail._(validateEmail(finalInput));
  }

  /// Creates a new `IEmail` object with the specified value.
  const IEmail._(this.value);
}
