import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/product.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@Freezed(addImplicitFinal: false)
@JsonSerializable(createFactory: false)
class ProductDto with _$ProductDto {
  @Entity(realClass: ProductDto)
  factory ProductDto({
    int? id,
    required String uid,
    required String title,
    String? description,
    required double price,
    @JsonKey(name: 'featured_image') required String featuredImage,
    String? unit,
    double? weight,
    bool? available,
    @JsonKey(name: 'category_id') required String categoryId,
    double? rating,
    dynamic reviews,
    @JsonKey(name: 'is_featured') bool? isFeatured,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

extension ProductDtoX on ProductDto {
  Product get toDomain => Product(
        id: id,
        uid: uid,
        title: title,
        description: description,
        price: price,
        featuredImage: featuredImage,
        unit: unit,
        weight: weight,
        available: available,
        categoryId: categoryId,
        rating: rating,
        reviews: reviews,
        isFeatured: isFeatured,
      );
}
