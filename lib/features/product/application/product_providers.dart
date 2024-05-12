import 'package:gromuse/config/config.dart';
import 'package:gromuse/features/product/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_providers.g.dart';

@riverpod
IProductFacade product(ProductRef ref) => di<IProductFacade>();

@riverpod
String productError(ProductErrorRef ref, ProductException exception) {
  return exception.map(
    message: (error) => error.message,
    serverError: (_) => 'Server Error',
    unknownError: (_) => 'Unknown Error',
    timeOutError: (_) => 'The server timed out',
    networkError: (_) => 'Network Error',
  );
}
