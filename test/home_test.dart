import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/prod_display.dart';
import 'package:union_shop/models/navigation.dart';
import 'package:union_shop/models/navigation.dart' show Footer;

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // use a wide test window to avoid RenderFlex overflow errors in navbar/footer
    binding.window.physicalSizeTestValue = const Size(1280, 1024);
    binding.window.devicePixelRatioTestValue = 1.0;
  });

  tearDownAll(() {
    binding.window.clearPhysicalSizeTestValue();
    binding.window.clearDevicePixelRatioTestValue();
  });

  group('Home Page Tests', () {
    testWidgets('Navbar shows header icons', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Navbar())));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.man), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag), findsWidgets);
    });

    testWidgets('Footer shows opening hours text (mobile layout)', (tester) async {
      // Wrap footer in a narrow box so it uses the mobile layout path
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: Center(child: SizedBox(width: 360, child: Footer()))),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.textContaining('PLEASE NOTE THE UNION SHOP'), findsOneWidget);
    });

    testWidgets('ProductDisplay builds with name and cost', (tester) async {
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
