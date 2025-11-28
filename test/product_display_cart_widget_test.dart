import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/cart_data.dart';

void main() {
  group('CartData.buildcart', () {
    testWidgets('returns empty-cart Column when cart is empty', (tester) async {
      cd = CartData();
      cd.cartlist.clear();

      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: SizedBox())));
      final BuildContext context = tester.element(find.byType(SizedBox));

      final widget = cd.buildcart(context);
      // Should be a Column and contain the 'your cart is currently empty' text
      expect(widget, isA<Column>());

      bool containsText(Widget w, String needle) {
        if (w is Text) {
          final d = w.data ?? '';
          if (d.contains(needle)) return true;
        }
        if (w is SingleChildRenderObjectWidget) {
          final child = (w as dynamic).child as Widget?;
          if (child != null && containsText(child, needle)) return true;
        }
        if (w is MultiChildRenderObjectWidget) {
          final children = (w as dynamic).children as List<Widget>?;
          if (children != null) {
            for (final c in children) {
              if (containsText(c, needle)) return true;
            }
          }
        }
        return false;
      }

      expect(containsText(widget, 'your cart is currently empty'), isTrue);
    });

    testWidgets('returns non-empty Column when cart has items', (tester) async {
      cd = CartData();
      cd.cartlist.clear();
      cd.instcartprod('apple', '£3.00', 'p');

      await tester
          .pumpWidget(const MaterialApp(home: Scaffold(body: SizedBox())));
      final BuildContext context = tester.element(find.byType(SizedBox));

      final widget = cd.buildcart(context);
      expect(widget, isA<Column>());
      bool containsTextRec(Widget w, String needle) {
        if (w is Text) {
          final d = w.data ?? '';
          if (d.contains(needle)) return true;
        }
        if (w is SingleChildRenderObjectWidget) {
          final child = (w as dynamic).child as Widget?;
          if (child != null && containsTextRec(child, needle)) return true;
        }
        if (w is MultiChildRenderObjectWidget) {
          final children = (w as dynamic).children as List<Widget>?;
          if (children != null) {
            for (final c in children) {
              if (containsTextRec(c, needle)) return true;
            }
          }
        }
        return false;
      }

      expect(containsTextRec(widget, 'Subtotal'), isTrue);
    });
  });
}
