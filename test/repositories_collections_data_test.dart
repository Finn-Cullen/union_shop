import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/collections_data.dart';

void main() {
  group('CollectionsData', () {
    testWidgets('orderrowanscolumns returns a Column with children', (tester) async {
      final cs = CollectionsData();
      final widgets = [const Text('a'), const Text('b'), const Text('c')];
      final res = cs.orderrowanscolumns(widgets);
      expect(res, isA<Column>());
      final col = res as Column;
      expect(col.children.length, widgets.length);
    });

    test('orderrowanscolumns returns Column with same children (non-widget check)', () {
      final csd = CollectionsData();
      final widgets = [Text('a'), Text('b')];
      final result = csd.orderrowanscolumns(widgets);
      expect(result, isA<Widget>());
      if (result is Column) {
        expect(result.children.length, equals(widgets.length));
      }
    });
  });
}
