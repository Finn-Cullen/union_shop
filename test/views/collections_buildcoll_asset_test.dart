import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/repositories/collections_data.dart';

void main() {
  testWidgets('buildcoll sets collections to Column when asset available',
      (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();

    final jsonContent = jsonEncode({
      'values': [
        {'collname': 'C1', 'displaypath': 'p1'},
        {'collname': 'C2', 'displaypath': 'p2'}
      ]
    });

    binding.defaultBinaryMessenger.setMockMessageHandler('flutter/assets',
        (message) async {
      final key = utf8.decode(message!.buffer.asUint8List());
      if (key == 'assets/enums/Collections.json') {
        final bytes = utf8.encode(jsonContent);
        return ByteData.view(Uint8List.fromList(bytes).buffer);
      }
      return null;
    });

    // Pump a MaterialApp to get a valid BuildContext
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: SizedBox())));
    final BuildContext context = tester.element(find.byType(SizedBox));

    final cs = CollectionsData();
    cs.buildcoll(context); // returns void; allow async work to complete
    await tester.pumpAndSettle();

    expect(cs.collections, isA<Widget>());
    expect(cs.collections.runtimeType.toString(), contains('Column'));
    expect(cs.datalist, isA<Future<List<Map<String, dynamic>>>>());
  });
}
