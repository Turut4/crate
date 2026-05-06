import 'package:crate/features/inventory/providers/inventory_provider.dart';
import 'package:crate/features/inventory/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crate"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.storage),
            tooltip: 'Gerar Dados de Teste',
            onPressed: () {
              context.read<InventoryProvider>().populateTestData();
            },
          ),
        ],
      ),
      body: Consumer<InventoryProvider>(
        builder: (context, inventoryProvider, child) {
          final products = inventoryProvider.products;

          if (products.isEmpty) {
            return const Center(child: Text("Your inventory is empty."));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return ProductCard(item: item);
            },
          );
        },
      ),
    );
  }
}
