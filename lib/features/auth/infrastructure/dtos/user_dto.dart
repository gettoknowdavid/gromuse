import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false)
class UserDto with _$UserDto {
  factory UserDto({
    required String id,
    required String name,
    required String email,
    String? photoUrl,
    String? phone,
    @Default(false) bool isVerified,
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
      email: IEmail(email),
      name: IName(name),
      photoUrl: photoUrl,
      phone: phone,
      isVerified: isVerified,
    );
  }
}
