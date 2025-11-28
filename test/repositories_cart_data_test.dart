import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/cart_data.dart';

void main() {
  group('CartData', () {
    test('instcartprod, totalnumprod and destcartprod behave as expected', () {
      final c = CartData();
      // start empty
      expect(c.totalnumprod('apple'), 0);

      c.instcartprod('apple', '£3.50', 'path1');
      c.instcartprod('apple', 'sale £2.00', 'path1');
      c.instcartprod('banana', '£1.00', 'path2');

      expect(c.totalnumprod('apple'), 2);
      expect(c.totalnumprod('banana'), 1);

      // remove one apple
      c.destcartprod('apple');
      expect(c.totalnumprod('apple'), 1);
    });

    test('proddisplist returns unique products and subtotal computes correctly', () {
      final c = CartData();
      c.cartlist.clear();
      c.instcartprod('apple', '£3.50', 'path1');
      c.instcartprod('apple', '£3.50', 'path1');
      c.instcartprod('banana', '£2.00', 'path2');

      final disp = c.proddisplist();
      // Should only contain unique names
      final names = disp.map((w) => (w as ProductDisplayCart).name).toList();
      expect(names.toSet().length, names.length);
      expect(names, containsAll(['apple', 'banana']));

      // subtotal should parse numbers correctly
      expect(c.subtotal(), closeTo(3.50 + 3.50 + 2.00, 0.0001));
    });
  });
}
