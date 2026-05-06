import 'package:isar/isar.dart';

part 'product.g.dart';

@collection
class Product {
  Id id = Isar.autoIncrement;

  late String name;
  late int currentQuantity;
  late int minLimit;
  late int targetQuantity;
  String? category;
  String? imagePath;

  bool get needsRestock => currentQuantity <= minLimit;
  int get amountToOrder => targetQuantity - currentQuantity;
}
