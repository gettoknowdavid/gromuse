import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/value_objects.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    required IName name,
    required IEmail email,
    String? photoUrl,
    String? phone,
    @Default(false) bool isVerified,
  }) = _User;
}
