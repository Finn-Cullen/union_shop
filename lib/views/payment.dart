import 'package:flutter/material.dart';
import 'package:union_shop/models/navigation.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Navbar(),
              SizedBox(
                width: double.infinity,
                height: isMobile ? 300 : 600,
                child: Center(
                    child: Text('your order has been placed',
                        style: TextStyle(fontSize: isMobile ? 16 : 20))),
              ),
              const Footer(),
            ],
          ),
        ),
      );
    });
  }
}
