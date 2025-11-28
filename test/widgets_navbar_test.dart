import 'dart:async';
 
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/navigation.dart';

void main() {
  testWidgets('Navbar shows mobile layout and menu items', (tester) async {
    // Provide a DefaultAssetBundle that won't error on Image.asset requests
    final bundle = TestAssetBundle();

    await tester.pumpWidget(DefaultAssetBundle(
      bundle: bundle,
      child: MaterialApp(
        // provide simple routes so Navigator.pushNamed doesn't throw
        routes: {
          '/search': (c) => const Scaffold(body: Text('search')),
          '/account': (c) => const Scaffold(body: Text('account')),
          '/cart': (c) => const Scaffold(body: Text('cart')),
          '/collections': (c) => const Scaffold(body: Text('collections')),
          '/sale': (c) => const Scaffold(body: Text('sale')),
          '/about-us': (c) => const Scaffold(body: Text('about')),
        },
        home: Scaffold(
          body: SizedBox(width: 360, child: const Navbar()),
        ),
      ),
    ));

    // Basic checks for presence of key buttons/text in mobile layout
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Shop'), findsOneWidget);
    expect(find.text('SALE!'), findsOneWidget);
    expect(find.text('about'), findsOneWidget);
  });
}

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    // Return a 1x1 transparent PNG so Image.asset can decode it in tests.
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
  Future<String> loadString(String key, {bool cache = true}) async => throw Exception('no asset');
}
