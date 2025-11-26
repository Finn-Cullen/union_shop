import 'package:flutter/material.dart';

ProductData pd = ProductData();

enum Products {
  a(
    name: 'awaw',
    url:
        'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498',
    cost: '£3.50',
    collections: ['Autumn favourites'],
    tags: ['clothing', 'merch'],
    featured: true,
    bestselling: 5,
    desc: 'this is a description',
  ),
  b(
    name: 'gagaw',
    url:
        'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498',
    cost: '£32.05',
    collections: ['Autumn favourites'],
    tags: ['clothing'],
    featured: false,
    bestselling: 2,
    desc: 'a different description',
  ),
  c(
    name: 'EWe',
    url:
        'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498',
    cost: '£123.00',
    collections: ['UPSU bears'],
    tags: ['merch'],
    featured: true,
    bestselling: 4,
    desc: 'yup a description',
  );

  const Products({
    required this.name,
    required this.url,
    required this.cost,
    required this.collections,
    required this.tags,
    required this.featured,
    required this.bestselling,
    required this.desc,
  });

  final String name;
  final String url;
  final String cost;
  final List<String> collections;
  final List<String> tags;
  final bool featured;
  final int bestselling;
  final String desc;
}

class ProductData {
  String prodcost = '';
  String produrl = '';
  String proddesc = '';
  String prodname = '';
  int numofprod = 0;
  Widget carttxt = const Text('');

  Widget carttxtbuild() {
    if (numofprod > 0) {
      return Text('$numofprod of items in cart');
    } else {
      return const Text('');
    }
  }
}
