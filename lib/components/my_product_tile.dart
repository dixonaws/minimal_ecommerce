import 'package:flutter/material.dart';
import '../models/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // image
          Icon(Icons.favorite),

          // name
          Text(product.name),

          // desc
          Text(product.description),

          // price + add to cart button
          Text(
            product.price.toStringAsFixed(2),
          ),
        ],
      ),
    );
  }
}
