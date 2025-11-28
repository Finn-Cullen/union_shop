import 'package:flutter/material.dart';
import 'package:union_shop/repositories/cart_data.dart';
import 'package:union_shop/models/navigation.dart';

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
    setState(() {
      cd.cartlist = [];
      cd.displist = [];
      cd.cart = cd.buildcart(context);
    });
    Navigator.pushNamed(context, '/payment');
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      updatepage();
    });
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Header
              const Navbar(),

              Text(
                'your cart',
                style: TextStyle(fontSize: isMobile ? 28 : 40),
              ),

              cd.cart,

              Wrap(
                spacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: updatepage, child: const Text('update page')),
                  ElevatedButton(
                      onPressed: () => navtopay(context),
                      child: const Text('pay')),
                ],
              ),

              const Footer(),
            ],
          ),
        ),
      );
    });
  }
}
