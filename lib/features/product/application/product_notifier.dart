import 'package:gromuse/features/product/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'product_providers.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  FutureOr<List<Product?>> build() async => [];

  Future<void> getAllProducts() async {
    state = const AsyncLoading();
    final response = await ref.read(productProvider).getAllProducts();
    return response.fold(
      (l) => AsyncError(ref.read(productErrorProvider(l)), StackTrace.current),
      (success) => AsyncData(success),
    );
  }
}
