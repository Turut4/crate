import 'package:crate/features/inventory/models/product.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class InventoryProvider extends ChangeNotifier {
  final Isar isar;
  List<Product> products = [];

  InventoryProvider(this.isar) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    products = await isar.products.where().findAll();
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    await isar.writeTxn(() async {
      await isar.products.put(product);
    });

    await loadProducts();
  }

  Future<void> updateQuantity(int id, int quantity) async {
    final product = await isar.products.get(id);
    if (product != null) {
      int current = product.currentQuantity;
      int newValue = current + quantity;
      product.currentQuantity = newValue < 0 ? 0 : newValue;

      await isar.writeTxn(() async {
        await isar.products.put(product);
      });
    }

    await loadProducts();
  }

  // 🧪 DADOS DE TESTE: Popula o banco com itens odontológicos reais
  Future<void> populateTestData() async {
    // Só adiciona se o banco estiver vazio para não duplicar toda vez que clicar
    if (products.isEmpty) {
      final mockProducts = [
        Product()
          ..name = 'Luvas de Procedimento M (Caixa)'
          ..currentQuantity = 15
          ..minLimit = 5
          ..targetQuantity = 20
          ..category = 'Descartáveis',
        Product()
          ..name = 'Sugador Descartável (Pacote)'
          ..currentQuantity = 8
          ..minLimit =
              10 // Abaixo do limite! (Precisa comprar)
          ..targetQuantity = 30
          ..category = 'Descartáveis',
        Product()
          ..name = 'Resina Composta A2 (Seringa)'
          ..currentQuantity = 3
          ..minLimit = 2
          ..targetQuantity = 10
          ..category = 'Dentística',
        Product()
          ..name = 'Anestésico Lidocaína (Caixa)'
          ..currentQuantity = 1
          ..minLimit =
              3 // Abaixo do limite!
          ..targetQuantity = 5
          ..category = 'Cirurgia',
        Product()
          ..name = 'Rolo de Algodão (Pacote)'
          ..currentQuantity = 12
          ..minLimit = 5
          ..targetQuantity = 20
          ..category = 'Descartáveis',
      ];

      await isar.writeTxn(() async {
        await isar.products.putAll(mockProducts);
      });

      await loadProducts();
    }
  }
}
