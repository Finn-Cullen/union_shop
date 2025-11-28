import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/products.dart';

void main() {
  test('Products enum contains expected members and fields', () {
    // basic sanity checks for enum values
    expect(Products.values.map((e) => e.name).toList(),
        containsAll(['awaw', 'gagaw', 'EWe']));

    final p = Products.a;
    expect(p.cost, isNotEmpty);
    expect(p.path, contains('https://'));
  });

  test('ProductData.carttxtbuild returns correct text when items > 0', () {
    final pdLocal = ProductData();
    pdLocal.numofprod = 0;
    final empty = pdLocal.carttxtbuild();
    expect(empty, isA<Text>());
    expect((empty as Text).data, '');

    pdLocal.numofprod = 3;
    final notEmpty = pdLocal.carttxtbuild();
    expect(notEmpty, isA<Text>());
    expect((notEmpty as Text).data, '3 of items in cart');
  });
}
