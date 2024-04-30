import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/value_objects.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    int? id,
    required String uid,
    required IName name,
    required IEmail email,
    String? photoUrl,
  }) = _User;
}
