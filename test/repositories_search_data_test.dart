import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/search_data.dart';
import 'package:union_shop/models/prod_display.dart';

void main() {
  group('SearchData', () {
    test('search falls back to Products enum when asset loading fails', () async {
      final s = SearchData();

      // Use a substring that appears in the enum names (e.g. 'aw' matches 'awaw' and 'gagaw')
      await s.search('aw');

      expect(s.searchlist, isNotEmpty);
      // All entries should be ProductDisplay instances
      for (final w in s.searchlist) {
        expect(w, isA<ProductDisplay>());
        final pd = w as ProductDisplay;
        expect(pd.name.toLowerCase(), contains('aw'));
      }
    });
  });
}
