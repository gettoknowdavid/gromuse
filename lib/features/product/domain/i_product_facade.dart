import 'package:dartz/dartz.dart';

import 'entities/entities.dart';
import 'product_exception.dart';

abstract class IProductFacade {
  Future<Either<ProductException, List<Category?>>> getCategories();

  Future<Either<ProductException, List<Product?>>> getAllProducts();
}
