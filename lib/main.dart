import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/pages/cart_page.dart';
import 'package:minimal_ecommerce/pages/intro_page.dart';
import 'package:minimal_ecommerce/pages/shop_page.dart';
import 'package:minimal_ecommerce/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => CartPage(),
      }
    );
  }
}
