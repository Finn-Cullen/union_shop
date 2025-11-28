import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:union_shop/models/products.dart';
import 'package:union_shop/models/prod_display.dart';

class SearchData {
  List<Widget> searchlist = [];

  /// Search the `assets/enums/Products.json` file for product names containing `inp`.
  /// This loads the JSON from assets (async) and updates `searchlist`.
  Future<void> search(String inp) async {
    final List<Widget> sealist = [];
    try {
      final jsonString =
          await rootBundle.loadString('assets/enums/Products.json');
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      final values =
          List<Map<String, dynamic>>.from(jsonData['values'] as List);

      final needle = inp.toLowerCase();
      for (final item in values) {
        final name = (item['name'] ?? '').toString();
        if (name.toLowerCase().contains(needle)) {
          final path = (item['path'] ?? '').toString();
          final cost = (item['cost'] ?? '').toString();
          final desc = (item['desc'] ?? '').toString();
          sealist.add(ProductDisplay(name, cost, path, desc));
        }
      }
    } catch (e) {
      // If loading/parsing fails, fall back to the built-in enum as a best effort.
      final needle = inp.toLowerCase();
      for (final T in Products.values) {
        if (T.name.toLowerCase().contains(needle)) {
          sealist.add(ProductDisplay(T.name, T.cost, T.path, T.desc));
        }
      }
    }

    searchlist = sealist;
  }
}
