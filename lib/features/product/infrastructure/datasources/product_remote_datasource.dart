import 'package:gromuse/services/services.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';

@lazySingleton
class ProductRemoteDatasource {
  ProductRemoteDatasource({required SupabaseService supabase})
      : _supabase = supabase;

  final SupabaseService _supabase;

  Future<List<ProductDto?>> getAllProducts() async {
    return await _supabase.client
        .from('products')
        .select('uid, title, price, featured_image, unit, weight, category_id')
        .withConverter((data) => data.map(ProductDto.fromJson).toList());
  }

  Future<List<CategoryDto?>> getCategories() async {
    return await _supabase.client
        .from('categories')
        .select('uid, title, description, image_url')
        .withConverter((data) => data.map(CategoryDto.fromJson).toList());
  }
}
