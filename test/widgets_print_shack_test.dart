import 'dart:async';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/the_print_shack.dart';

void main() {
  testWidgets('Print page shows Personalisation and price', (tester) async {
    final bundle = TestAssetBundle();

    tester.view.physicalSize = const Size(2400, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(DefaultAssetBundle(
      bundle: bundle,
      child: MaterialApp(
          home:
              Scaffold(body: SizedBox(width: 2000, child: const PrintPage()))),
    ));

    await tester.pumpAndSettle();

    expect(find.text('Personalisation'), findsOneWidget);
    expect(find.textContaining('£'), findsWidgets);
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
  Future<T> loadStructuredBinaryData<T>(
      String key, FutureOr<T> Function(ByteData) loader) async {
    final codec = const StandardMessageCodec();
    final dynamic encoded = codec.encodeMessage(<String, List<String>>{});
    if (encoded is ByteData) return loader(encoded);
    if (encoded is Uint8List) return loader(ByteData.view(encoded.buffer));
    return loader(ByteData.view(Uint8List.fromList([0]).buffer));
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key.contains('PersTypes.json')) {
      return jsonEncode({
        'values': [
          {'perstype': 'one line', 'persprice': '£3.00', 'lineoftext': 1}
        ]
      });
    }
    return '';
  }
}
