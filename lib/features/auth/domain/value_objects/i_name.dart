import 'package:dartz/dartz.dart';
import 'package:gromuse/common/common.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import 'validators.dart';

/// A typedef representing the result of validating a full name.
typedef INameResult = Either<ValueFailure<String>, String>;

/// Represents a full name of a Meno user.
class IName extends ValueObject<String> {
  /// The full name, validated or not.
  @override
  final INameResult value;

  /// Creates a new `IName` object.
  factory IName(String input) {
    final finalInput = toBeginningOfSentenceCase(input).trim();
    return IName._(validateNotEmpty(finalInput));
  }

  /// Creates a new `IName` object with the specified value.
  const IName._(this.value);
}
