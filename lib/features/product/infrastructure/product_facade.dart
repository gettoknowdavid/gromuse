import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../domain/domain.dart';
import 'datasources/datasources.dart';
import 'dtos/dtos.dart';

@Injectable(as: IProductFacade)
class ProductFacade implements IProductFacade {
  ProductFacade({
    required ProductRemoteDatasource remote,
    required ProductLocalDatasource local,
  })  : _remote = remote,
        _local = local;

  final ProductRemoteDatasource _remote;
  final ProductLocalDatasource _local;

  @override
  Future<Either<ProductException, List<Product?>>> getAllProducts() async {
    try {
      final dtos = await _remote.getAllProducts();

      if (dtos.isNotEmpty) {
        await _local.cacheProducts(dtos.whereNotNull().toList());
      }

      final products = dtos.map((dto) => dto?.toDomain).toList();

      return right(products);
    } on Exception catch (e) {
      return left(ProductException.message(e.toString()));
    }
  }

  @override
  Future<Either<ProductException, List<Category?>>> getCategories() async {
    try {
      final dtos = await _remote.getCategories();

      if (dtos.isNotEmpty) {
        await _local.cacheCategories(dtos.whereNotNull().toList());
      }

      final categories = dtos.map((dto) => dto?.toDomain).toList();

      return right(categories);
    } on Exception catch (e) {
      return left(ProductException.message(e.toString()));
    }
  }
}
