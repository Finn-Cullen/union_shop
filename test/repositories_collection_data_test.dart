import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/collection_data.dart';
import 'package:union_shop/models/prod_display.dart';

void main() {
  group('CollectionData pure methods', () {
    test('filterproducts filters by tag list', () {
      final cd = CollectionData();
      cd.filter = 'clothing';
      final p1 = ProductDisplay('A', '£1.00', 'p', 'd');
      final p2 = ProductDisplay('B', '£2.00', 'p', 'd');
      final products = [p1, p2];
      final tags = [ ['clothing'], ['other'] ];
      final filtered = cd.filterproducts(products, tags);
      expect(filtered.length, 1);
      expect(filtered.first, p1);
    });

    test('sortforcollections only keeps items present in collections list', () {
      final cd = CollectionData();
      final p1 = ProductDisplay('A', '£1.00', 'p', 'd');
      final p2 = ProductDisplay('B', '£2.00', 'p', 'd');
      final products = [p1, p2];
      final collLists = [ ['UPSU bears'], ['Other'] ];
      // csd.collselected default is 'UPSU bears'
      final sorted = cd.sortforcollections(products, collLists);
      expect(sorted.length, 1);
      expect(sorted.first, p1);
    });

    test('sortproducts orders by low to high and high to low', () {
      final cd = CollectionData();
      final p1 = ProductDisplay('A', '£2.00', 'p', 'd');
      final p2 = ProductDisplay('B', '£1.00', 'p', 'd');
      final list = [p1, p2];
      final feat = [false, false];
      final best = [1, 2];

      cd.sortmethod = 'low to high';
      final lowToHigh = cd.sortproducts(List.from(list), feat, best);
      expect(lowToHigh.first.cost, '£1.00');

      cd.sortmethod = 'high to low';
      final highToLow = cd.sortproducts(List.from(list), feat, best);
      expect(highToLow.first.cost, '£2.00');
    });
  });
}
