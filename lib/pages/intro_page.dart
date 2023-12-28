import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Center(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            SizedBox(height: 25),

            // title
            Text("Minimal shop",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),

            // subtitle
            Text("Premium products",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )),

            SizedBox(height: 80),

            MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page'), child: Icon(Icons.arrow_forward)),
            // button
          ],
        ));
  }
}
