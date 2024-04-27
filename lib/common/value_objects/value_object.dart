import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'value_failure.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  @override
  int get hashCode => value.hashCode;

  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T? get() => value.fold((l) => l.mapOrNull(), id);

  T getOrElse(T dflt) => value.getOrElse(() => dflt);

  /// Returns a bool after validating the current type
  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';
}
