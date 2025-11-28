import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collection.dart';
import 'package:union_shop/repositories/collections_data.dart';

void main() {
  testWidgets('Collection page shows collection title', (tester) async {
    final bundle = TestAssetBundle();

    // enlarge the test window to avoid tight layout overflows
    final binding = tester.binding;
    binding.window.physicalSizeTestValue = const Size(800, 1200);
    binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });

    await tester.pumpWidget(DefaultAssetBundle(
      bundle: bundle,
      child: MaterialApp(
        home: Scaffold(body: SizedBox(width: 360, child: const CollectionPage())),
      ),
    ));

    await tester.pumpAndSettle();

    // default selected collection should be visible
    expect(find.text(csd.collselected), findsOneWidget);
  });
}

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    final pngBase64 =
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGMAAQAABQABDQottAAAAABJRU5ErkJggg==';
    final bytes = base64Decode(pngBase64);
    return ByteData.view(Uint8List.fromList(bytes).buffer);
  }

  @override
  Future<T> loadStructuredBinaryData<T>(String key, FutureOr<T> Function(ByteData) loader) async {
    final codec = const StandardMessageCodec();
    final dynamic encoded = codec.encodeMessage(<String, List<String>>{});
    if (encoded is ByteData) return loader(encoded);
    if (encoded is Uint8List) return loader(ByteData.view(encoded.buffer));
    return loader(ByteData.view(Uint8List.fromList([0]).buffer));
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    // Provide minimal JSON for filter/sort/collections to avoid rootBundle errors if used
    if (key.contains('Collections.json')) {
      return jsonEncode({'values': [{'collname': 'UPSU bears', 'displaypath': 'assets/images/logo.png'}]});
    }
    if (key.contains('FilterMenu.json') || key.contains('SortMenu.json')) {
      return jsonEncode({'values': []});
    }
    return '';
  }
}
