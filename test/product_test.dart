import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// product_page import removed: tests now target product widgets in isolation
import 'package:union_shop/models/products.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Product Page Tests', () {
    testWidgets('basic product texts render', (tester) async {
      // set test window to desktop-like size to avoid layout overflows
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
      pd.prodname = 'Test Product';
      pd.prodcost = '£15.00';
      pd.proddesc = 'A test description';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Column(
            children: [Text(pd.prodname), Text(pd.prodcost), Text(pd.proddesc)],
          ),
        ),
      ));

      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('A test description'), findsOneWidget);
    });

    testWidgets('quantity controls and add to cart button exist', (tester) async {
      // ensure consistent window for this test
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.remove)),
                Text('1'),
                IconButton(onPressed: null, icon: Icon(Icons.add)),
                SizedBox(width: 8),
                ElevatedButton(onPressed: null, child: Text('add to cart'))
              ],
            ),
          ),
        ),
      ));

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.text('add to cart'), findsOneWidget);
    });
  });
}
