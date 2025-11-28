import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/collections_data.dart';

void main() {
  test('orderrowanscolumns wraps widgets in a Column with same children', () {
    final cds = CollectionsData();
    final widgets = [const Text('a'), const Text('b')];
    final result = cds.orderrowanscolumns(widgets);
    expect(result, isA<Column>());
    final column = result as Column;
    expect(column.children.length, equals(2));
    expect(column.children.first, isA<Text>());
    final first = column.children.first as Text;
    expect(first.data, 'a');
  });
}
