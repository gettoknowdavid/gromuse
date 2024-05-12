import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  factory Category({
    int? id,
    required String uid,
    required String title,
    String? description,
    String? imageUrl,
  }) = _Category;
}
