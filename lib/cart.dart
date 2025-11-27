import 'package:flutter/material.dart';
import 'package:union_shop/cart_data.dart';
import 'package:union_shop/navigation.dart';

class CartPage extends StatefulWidget {
  // needs to be statefull
  const CartPage({super.key});

  @override
  State<CartPage> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {
  void updatepage() {
    setState(() {
      cd.displist = cd.proddisplist();
      cd.cart = cd.buildcart(context);
    });
  }

  void navtopay(BuildContext context) {
    cd.cartlist = [];
    setState(() {
      cd.displist = cd.proddisplist();
      cd.cart = cd.buildcart(context);
    }); // empties cart
    Navigator.pushNamed(context, '/payment');
  }

  @override
  Widget build(BuildContext context) {
    updatepage();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const Navbar(),

            const Text(
              'your cart',
              style: TextStyle(fontSize: 40),
            ),

            cd.cart,

            ElevatedButton(
                onPressed: updatepage, child: const Text('update page')),

            ElevatedButton(
                onPressed: () => navtopay(context), child: const Text('pay')),

            const Footer(),
          ],
        ),
      ),
    );
  }
}
