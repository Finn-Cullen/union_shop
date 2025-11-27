import 'package:flutter/material.dart';
import 'package:union_shop/navigation.dart';
import 'package:union_shop/collections_data.dart';

class CollectionsPage extends StatefulWidget {
  // needs to be statefull
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() {
    return CollectionsPageState();
  }
}

class CollectionsPageState extends State<CollectionsPage> {

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  void reloadpage(BuildContext context) {
    setState(() {
      csd.buildcoll(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    csd.buildcoll(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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

            ElevatedButton(onPressed: () => reloadpage(context), child: Text('Reload Page')),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
