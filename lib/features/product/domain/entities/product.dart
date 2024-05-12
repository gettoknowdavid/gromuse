import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  factory Product({
    int? id,
    required String uid,
    required String title,
    String? description,
    required double price,
    required String featuredImage,
    String? unit,
    double? weight,
    bool? available,
    required String categoryId,
    double? rating,
    dynamic reviews,
    bool? isFeatured,
  }) = _Product;
}
