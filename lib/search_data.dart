import 'package:flutter/material.dart';
import 'package:union_shop/products.dart';
import 'package:union_shop/prod_display.dart';

class SearchData {
  List<Widget> searchlist = [];

  void search(String inp) {
    List<Widget> sealist = [];
    Products.values.map((T) {
      if (T.name.contains(inp)) {
        sealist.add(ProductDisplay(
          T.name,
          T.cost,
          T.path,
          T.desc,
        ));
      }
    }).toList();
    searchlist = sealist;
  }
}
