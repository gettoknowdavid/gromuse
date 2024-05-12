import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/category.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@Freezed(addImplicitFinal: false)
@JsonSerializable(createFactory: false)
class CategoryDto with _$CategoryDto {
  @Entity(realClass: CategoryDto)
  factory CategoryDto({
    int? id,
    required String uid,
    required String title,
    String? description,
    String? imageUrl,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}

extension CategoryDtoX on CategoryDto {
  Category get toDomain => Category(
        id: id,
        uid: uid,
        title: title,
        description: description,
        imageUrl: imageUrl,
      );
}
