import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/prod_display.dart';
import 'package:union_shop/models/navigation.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Home Page Tests', () {
    testWidgets('Navbar shows header icons', (tester) async {
      // ensure consistent desktop-like size for layout
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Navbar())));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.man), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag), findsWidgets);
    });

    testWidgets('Footer shows opening hours text (mobile layout)', (tester) async {
      // ensure consistent desktop-like size for layout
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // Wrap footer in a narrow box so it uses the mobile layout path
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: Center(child: SizedBox(width: 360, child: Footer()))),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.textContaining('PLEASE NOTE THE UNION SHOP'), findsOneWidget);
    });

    testWidgets('ProductDisplay builds with name and cost', (tester) async {
      tester.view.physicalSize = const Size(1280, 1024);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
      final widget = MaterialApp(
        home: Scaffold(
          body: ProductDisplay('Test Name', '£9.99', 'assets/images/magnet_B.jpg', 'desc'),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('Test Name'), findsOneWidget);
      expect(find.text('£9.99'), findsOneWidget);
    });
  });
}
