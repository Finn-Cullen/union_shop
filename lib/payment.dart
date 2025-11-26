import 'package:flutter/material.dart';
import 'package:union_shop/navigation.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Navbar(),
            SizedBox(
              width: double.infinity,
              height: 600,
              child: Center(child: Text('your order has been placed')),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
