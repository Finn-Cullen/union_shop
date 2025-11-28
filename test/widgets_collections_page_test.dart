import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/collections.dart';

void main() {
  testWidgets('Collections page shows header', (tester) async {
    final bundle = TestAssetBundle();

    final binding = tester.binding;
    binding.window.physicalSizeTestValue = const Size(2400, 1600);
    binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });

    await tester.pumpWidget(DefaultAssetBundle(
      bundle: bundle,
      child: MaterialApp(
        home: Scaffold(body: SizedBox(width: 2000, child: const CollectionsPage())),
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.text('COLLECTIONS'), findsOneWidget);
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
    if (key.contains('Collections.json')) {
      return jsonEncode({'values': [{'collname': 'UPSU bears', 'displaypath': 'assets/images/logo.png'}]});
    }
    if (key.contains('FilterMenu.json') || key.contains('SortMenu.json') || key.contains('TPS.json')) {
      return jsonEncode({'values': []});
    }
    return '';
  }
}
