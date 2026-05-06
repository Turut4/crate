import 'dart:io';

import 'package:crate/features/inventory/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product item;

  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final int atual = item.currentQuantity;
    final int min = item.minLimit;
    final bool isLowStock = atual <= min;

    final Color bgColor = isLowStock ? Colors.red.shade50 : Colors.white;
    final Color textColor = isLowStock ? Colors.red.shade900 : Colors.black87;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      color: bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: item.imagePath != null
                ? Image.file(File(item.imagePath!))
                : Container(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  item.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Text(
                  "Atual: $atual | Mín: $min",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: isLowStock
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
