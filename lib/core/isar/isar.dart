import "package:crate/features/inventory/models/product.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";

Future<Isar> openDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([ProductSchema], directory: dir.path);

  return isar;
}
