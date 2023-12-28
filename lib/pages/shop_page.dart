import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_drawer.dart';
import 'package:minimal_ecommerce/components/my_product_tile.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: Text('Shop'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          // get each individual item from the shop
          final product = products[index];

          // return as a product tile
          return (MyProductTile(product: product));
        },
      ),
    );
  }
}
