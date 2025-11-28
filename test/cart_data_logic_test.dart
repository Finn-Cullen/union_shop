import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/cart_data.dart';

void main() {
  test('instcartprod adds new product entries', () {
    final cart = CartData();
    cart.cartlist.clear();

    cart.instcartprod('x', '£2.00', 'p');
    expect(cart.cartlist.length, 1);

    // add same product again -> another entry appended
    cart.instcartprod('x', '£2.00', 'p');
    expect(cart.cartlist.length, 2);
    expect(cart.totalnumprod('x'), 2);
  });

  test('destcartprod removes or decrements product', () {
    final cart = CartData();
    cart.cartlist.clear();
    cart.instcartprod('y', '£3.00', 'p');
    cart.instcartprod('y', '£3.00', 'p');
    expect(cart.totalnumprod('y'), 2);

    cart.destcartprod('y');
    expect(cart.totalnumprod('y'), 1);

    // remove until gone
    cart.destcartprod('y');
    // product should be removed
    expect(cart.cartlist.where((e) => e.name == 'y').isEmpty, true);
  });

  test('subtotal calculates numeric sum correctly', () {
    final cart = CartData();
    cart.cartlist.clear();
    // add two of product a
    cart.instcartprod('a', '£1.50', 'p');
    cart.instcartprod('a', '£1.50', 'p');
    // add one of product b
    cart.instcartprod('b', '£2.00', 'p');

    final sum = cart.subtotal();
    expect(sum, closeTo(5.0, 0.01));
  });
}
