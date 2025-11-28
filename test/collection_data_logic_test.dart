import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/collection_data.dart';
import 'package:union_shop/models/prod_display.dart';
import 'package:union_shop/repositories/collections_data.dart';

void main() {
  test('sortforcollections filters by selected collection', () {
    // arrange
    csd.collselected = 'colA';
    final cdLocal = CollectionData();
    final list = [
      ProductDisplay('p1', '£1', 'p', 'd'),
      ProductDisplay('p2', '£2', 'p', 'd'),
      ProductDisplay('p3', '£3', 'p', 'd'),
    ];
    final clist = [
      ['colA'],
      ['other'],
      ['colA'],
    ];

    // act
    final res = cdLocal.sortforcollections(list, clist);

    // assert
    expect(res.length, 2);
    expect(res.map((e) => e.name), containsAll(['p1', 'p3']));
  });

  test('filterproducts filters by tag', () {
    final cdLocal = CollectionData();
    cdLocal.filter = 'tag1';
    final list = [
      ProductDisplay('p1', '£1', 'p', 'd'),
      ProductDisplay('p2', '£2', 'p', 'd'),
    ];
    final tlist = [
      ['tag1'],
      ['other'],
    ];

    final res = cdLocal.filterproducts(list, tlist);
    expect(res.length, 1);
    expect(res.first.name, 'p1');
  });

  test('sortproducts sorts by numeric cost low-to-high and bestselling', () {
    final cdLocal = CollectionData();
    final list = [
      ProductDisplay('a', '£10', 'p', 'd'),
      ProductDisplay('b', '£5', 'p', 'd'),
      ProductDisplay('c', '£7', 'p', 'd'),
    ];

    // test low to high
    cdLocal.sortmethod = 'low to high';
    final resLow =
        cdLocal.sortproducts(List.from(list), [false, false, false], [1, 2, 3]);
    expect(resLow.first.name, 'b');

    // test best selling ordering uses bestlist when sortmethod is best selling
    cdLocal.sortmethod = 'best selling';
    final resBest =
        cdLocal.sortproducts(List.from(list), [false, false, false], [2, 3, 1]);
    // 'b' has best 3 so should be first if ordering applied
    expect(resBest.first.name, 'b');
  });
}
