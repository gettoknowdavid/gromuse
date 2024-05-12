import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../features/product/infrastructure/dtos/dtos.dart';
import '../objectbox.g.dart';

class ObjectBoxService {
  late final Store store;

  late Box<CategoryDto> _categoryBox;
  Box<CategoryDto> get categoryBox => _categoryBox;

  late Box<ProductDto> _productBox;
  Box<ProductDto> get productBox => _productBox;

  ObjectBoxService._create(this.store) {
    _categoryBox = store.box<CategoryDto>();
    _productBox = store.box<ProductDto>();
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBoxService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, 'gromuse'));
    return ObjectBoxService._create(store);
  }
}
