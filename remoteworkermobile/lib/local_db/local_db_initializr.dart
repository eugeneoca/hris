import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalDbInitializr {
  List<CollectionSchema<dynamic>> listSchemas = [];

  Future<void> openIsar() async {
    final dir = await getApplicationCacheDirectory();
    await Isar.open(listSchemas, directory: dir.path);
  }

  static Isar? isar = Isar.getInstance();
}
