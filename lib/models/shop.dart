import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(name: "Product1", price: 99.99, description: "Item description"),
    Product(name: "Product2", price: 199.99, description: "Item description"),
    Product(name: "Product3", price: 299.99, description: "Item description"),
    Product(name: "Product4", price: 599.99, description: "Item description"),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addItemToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
