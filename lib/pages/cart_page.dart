import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_button.dart';
import 'package:provider/provider.dart';
import 'package:minimal_ecommerce/models/product.dart';
import 'package:minimal_ecommerce/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                  "Are you sure you want to remove this item to the cart?"),
              actions: [
                // cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),

                // confirm button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeItemFromCart(product);
                  },
                  child: Text("Confirm"),
                ),
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("User wants to pay"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty ? Center(child: Text("Your cart is empty")) : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // get individual item
                final item = cart[index];

                // return as a cart tile
                return (ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => removeFromCart(context, item),
                  ),
                ));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: cart.isEmpty ? Text("") : MyButton(
                onTap: () => payButtonPressed(context), child: Text("Pay Now")),
          )
        ],
      ),
    );
  }
}
