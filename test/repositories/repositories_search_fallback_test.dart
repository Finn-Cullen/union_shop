import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/search_data.dart';
import 'package:union_shop/models/prod_display.dart';

void main() {
  test('SearchData falls back to enum when assets missing', () async {
    final sd = SearchData();
    // use a needle that matches the enum entry 'awaw'
    await sd.search('awaw');
    expect(sd.searchlist, isNotEmpty);
    final first = sd.searchlist.first;
    expect(first, isA<ProductDisplay>());
    final pd = first as ProductDisplay;
    expect(pd.name.toLowerCase(), contains('awaw'));
  });
}
