import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/cart.dart';
import 'package:union_shop/repositories/cart_data.dart';

void main() {
  testWidgets('Cart page displays cart header and product rows when items present', (tester) async {
    // ensure cart empty then add an item
    cd.cartlist = [];
    cd.displist = [];
    cd.instcartprod('CartTest', '£2.50', 'assets/images/logo.png');

    final bundle = TestAssetBundle();

    // enlarge test window to avoid layout overflows
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
        home: Scaffold(body: SizedBox(width: 360, child: const CartPage())),
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.text('your cart'), findsOneWidget);
    // product header should be present
    expect(find.text('product'), findsOneWidget);
    // the numeric cost should appear (CartItem stored cost without £)
    expect(find.text('2.50'), findsWidgets);
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
  Future<String> loadString(String key, {bool cache = true}) async => '';
}
