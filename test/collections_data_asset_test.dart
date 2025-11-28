import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/collections_data.dart';

void main() {
  testWidgets('buildlist reads Collections.json asset', (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();

    final jsonContent = jsonEncode({
      'values': [
        {'collname': 'C1', 'displaypath': 'p1'},
        {'collname': 'C2', 'displaypath': 'p2'}
      ]
    });

    binding.defaultBinaryMessenger.setMockMessageHandler('flutter/assets', (message) async {
      final key = utf8.decode(message!.buffer.asUint8List());
      if (key == 'assets/enums/Collections.json') {
        final bytes = utf8.encode(jsonContent);
        return ByteData.view(Uint8List.fromList(bytes).buffer);
      }
      return null;
    });

    final cs = CollectionsData();
    final list = await cs.buildlist();

    expect(list, isA<List<Map<String, dynamic>>>());
    expect(list.length, 2);
    expect(list[0]['collname'], 'C1');
  });
}
