import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/domain.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@Freezed(addImplicitFinal: false)
@JsonSerializable(createFactory: false)
class UserDto with _$UserDto {
  @Entity(realClass: UserDto)
  factory UserDto({
    int? id,
    required String uid,
    required String name,
    required String email,
    String? photoUrl,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

extension UserDtoToDomain on UserDto {
  User get toDomain {
    return User(
      id: id,
      uid: uid,
      email: IEmail(email),
      name: IName(name),
      photoUrl: photoUrl,
    );
  }
}
