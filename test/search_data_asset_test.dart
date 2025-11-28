import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/search_data.dart';
import 'package:union_shop/models/prod_display.dart';

void main() {
  testWidgets('search uses asset Products.json when available', (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();

    final jsonContent = jsonEncode({
      'values': [
        {'name': 'Test Product', 'path': 'p', 'cost': '£9.99', 'desc': 'd'}
      ]
    });

    binding.defaultBinaryMessenger.setMockMessageHandler('flutter/assets', (message) async {
      final key = utf8.decode(message!.buffer.asUint8List());
      if (key == 'assets/enums/Products.json') {
        final bytes = utf8.encode(jsonContent);
        return ByteData.view(Uint8List.fromList(bytes).buffer);
      }
      return null;
    });

    final s = SearchData();
    await s.search('Test');

    expect(s.searchlist, isNotEmpty);
    expect(s.searchlist.first, isA<ProductDisplay>());
    final pd = s.searchlist.first as ProductDisplay;
    expect(pd.name, 'Test Product');
  });
}
