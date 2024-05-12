import 'package:gromuse/services/objectbox_service.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

import '../dtos/dtos.dart';

@lazySingleton
class ProductLocalDatasource {
  ProductLocalDatasource({required ObjectBoxService objectBox})
      : _objectBox = objectBox;

  final ObjectBoxService _objectBox;

  Box<ProductDto> get _productBox => _objectBox.productBox;
  Box<CategoryDto> get _categoryBox => _objectBox.categoryBox;

  Future<void> cacheCategories(List<CategoryDto> categories) async {
    await _categoryBox.putManyAsync(categories);
    return;
  }

  Future<List<CategoryDto?>> getCategories() => _categoryBox.getAllAsync();

  Future<void> cacheProducts(List<ProductDto> products) async {
    await _productBox.putManyAsync(products);
    return;
  }

  Future<List<ProductDto?>> getProducts() => _productBox.getAllAsync();
}
