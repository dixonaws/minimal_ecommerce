import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(name: "Sunglasses", price: 99.99, description: "Sunglasses", imagePath: "assets/sunglasses.png"),
    Product(name: "Laptop", price: 5199.99, description: "Macbook Pro", imagePath: "assets/laptop.png"),
    Product(name: "Bicycle", price: 8299.99, description: "Specialized Roubaix", imagePath: "assets/bike.png"),

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
