import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class ObjectBoxService {
  late final Store store;

  ObjectBoxService._create(this.store) {
    //
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBoxService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, 'gromuse'));
    return ObjectBoxService._create(store);
  }
}
