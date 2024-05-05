import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@Freezed(addImplicitFinal: false)
@JsonSerializable(createFactory: false)
class ProductDto with _$ProductDto {
  @Entity(realClass: ProductDto)
  factory ProductDto({
    int? id,
    required String title,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
