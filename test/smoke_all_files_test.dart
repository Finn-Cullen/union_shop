import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

// Import app files to ensure they compile and can be referenced
import 'package:union_shop/main.dart' as app_main;
import 'package:union_shop/models/navigation.dart' as nav;
import 'package:union_shop/models/prod_display.dart' as pdsp;
import 'package:union_shop/repositories/collection_data.dart' as cdata;
import 'package:union_shop/repositories/collections_data.dart' as csdata;

void main() {
  test('Can reference top-level widgets and classes from lib', () {
    // instantiate a few types to ensure imports and constructors are working
    final _ = app_main.UnionShopApp();
    final navBar = nav.Navbar();
    final footer = nav.Footer();
    final prodDisplay = pdsp.ProductDisplay('a', '£1.0', 'p', 'd');
    final cd = cdata.CollectionData();
    final cs = csdata.CollectionsData();

    expect(navBar, isA<Widget>());
    expect(footer, isA<Widget>());
    expect(prodDisplay, isA<Widget>());
    expect(cd, isNotNull);
    expect(cs, isNotNull);
  });
}
