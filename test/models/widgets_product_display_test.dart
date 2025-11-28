import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/prod_display.dart';
import 'package:union_shop/models/products.dart';

void main() {
  testWidgets('ProductDisplay.navtoprod sets ProductData and navigates',
      (tester) async {
    // reset global product data
    pd = ProductData();

    final observer = _RecordingNavigatorObserver();

    // Build a simple button that calls ProductDisplay.navtoprod(context) when tapped.
    await tester.pumpWidget(MaterialApp(
      routes: {'/product': (c) => const Scaffold(body: Text('product'))},
      navigatorObservers: [observer],
      home: Scaffold(
        body: Builder(builder: (context) {
          return TextButton(
            onPressed: () =>
                ProductDisplay('Test Product', '£3.00', 'p', 'desc')
                    .navtoprod(context),
            child: const Text('invoke'),
          );
        }),
      ),
    ));

    expect(find.text('invoke'), findsOneWidget);
    await tester.tap(find.text('invoke'));
    await tester.pumpAndSettle();

    expect(pd.prodname, 'Test Product');
    expect(observer.pushed, isTrue);
  });
}

class _RecordingNavigatorObserver extends NavigatorObserver {
  bool pushed = false;
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushed = true;
    super.didPush(route, previousRoute);
  }
}
