import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/sale.dart';

class TestAssetBundle extends CachingAssetBundle {
  final Map<String, String> _strings;
  TestAssetBundle(this._strings);

  static final _onePixelPng = base64Decode(
      'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVQYV2NgYAAAAAMAAWgmWQ0AAAAASUVORK5CYII=');

  @override
  Future<ByteData> load(String key) async {
    // If the asset manifest is requested, provide a StandardMessageCodec-encoded
    // manifest so Image/AssetManifest lookups succeed in tests.
    if (key.contains('AssetManifest')) {
      final manifest = <String, List<String>>{
        'assets/images/magnet_B.jpg': ['assets/images/magnet_B.jpg']
      };
      final codec = const StandardMessageCodec();
      final dynamic encoded = codec.encodeMessage(manifest);
      if (encoded is ByteData) return encoded;
      if (encoded is Uint8List) return ByteData.view(encoded.buffer);
      // fallback to a minimal empty buffer
      return ByteData.view(Uint8List.fromList([]).buffer);
    }
    // Return PNG bytes for image paths and any other binary assets
    return ByteData.view(Uint8List.fromList(_onePixelPng).buffer);
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    // Provide simple JSON for the two menu files
    if (key.contains('FilterMenu')) {
      return jsonEncode({
        'values': [
          {'text': 'all products'},
          {'text': 'on sale'}
        ]
      });
    }
    if (key.contains('SortMenu')) {
      return jsonEncode({
        'values': [
          {'text': 'Best Selling'},
          {'text': 'Low to High'}
        ]
      });
    }
    if (key.contains('AssetManifest.json')) {
      return jsonEncode({
        'assets/images/magnet_B.jpg': [
          {'asset': 'assets/images/magnet_B.jpg'}
        ]
      });
    }
    return _strings[key] ?? '';
  }
}

void main() {
  testWidgets('SalePage shows header, filters and product items', (WidgetTester tester) async {
    // set up a larger test window to avoid RenderFlex overflow
    tester.binding.window.physicalSizeTestValue = const Size(2000, 1200);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });

    final bundle = TestAssetBundle({});

    await tester.pumpWidget(MaterialApp(
      home: DefaultAssetBundle(
        bundle: bundle,
        child: const SalePage(useProductDisplay: false),
      ),
    ));

    // Allow futures inside the page to resolve
    await tester.pumpAndSettle();

    // Check for SALE header
    expect(find.text('SALE'), findsOneWidget);

    // Check filter/sort labels
    expect(find.text('FILTER BY'), findsOneWidget);
    expect(find.text('SORT BY'), findsOneWidget);

    // Check that at least one product display label from the page exists
    expect(find.textContaining('classic sweatshirts - neutral'), findsOneWidget);
  });
}
