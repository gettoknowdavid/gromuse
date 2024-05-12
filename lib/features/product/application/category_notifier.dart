import 'package:gromuse/features/product/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'product_providers.dart';

part 'category_notifier.g.dart';

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  @override
  FutureOr<List<Category?>> build() async => [];

  Future<void> getCategories() async {
    state = const AsyncLoading();
    final response = await ref.read(productProvider).getCategories();
    return response.fold(
      (l) => AsyncError(ref.read(productErrorProvider(l)), StackTrace.current),
      (success) => AsyncData(success),
    );
  }
}
