import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_drawer.dart';
import 'package:minimal_ecommerce/components/my_product_tile.dart';
import 'package:http/http.dart' as http;
import 'package:minimal_ecommerce/models/product.dart';

class ShopPage extends StatelessWidget {
  ShopPage({super.key});

  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    // access products
    // final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: Text('Shop'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  SizedBox(height: 25),
                  Center(
                      child: Text(
                    "Choose from a list of premium products",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  )),
                  SizedBox(
                    height: 550,
                    child: ListView.builder(
                      padding: EdgeInsets.all(15),
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // get each individual item from the shop
                        final product = products[index];

                        // return as a product tile
                        return (MyProductTile(product: product));
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            } // else
          }),
    );
  }

  // get products
  Future getProducts() async {
    var response = await http.get(
        Uri.https('hwaeknqjl3.execute-api.us-east-1.amazonaws.com', '/api'));
    var jsonData = jsonDecode(response.body);

    for (var eachProduct in jsonData) {
      var myProduct = Product(
          name: eachProduct['name'],
          price: eachProduct['price'],
          description: eachProduct['description'],
          imagePath: eachProduct['imagePath']);

      products.add(myProduct);
    }
  }
}
