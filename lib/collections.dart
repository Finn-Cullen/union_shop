import 'package:flutter/material.dart';
import 'package:union_shop/navigation.dart';
import 'package:union_shop/collections_data.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    csd.buildcoll(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            const SizedBox(
              // text at top
              height: 140,
              child: Text('COLLECTIONS', style: TextStyle(fontSize: 60)),
            ),
            SizedBox(
                // products
                child: csd.collections),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
