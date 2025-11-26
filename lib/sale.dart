import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:union_shop/navigation.dart';
import 'package:union_shop/prod_display.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  late Future<List<Map<String, dynamic>>> _filterMenuData;
  late Future<List<Map<String, dynamic>>> _sortMenuData;

  @override
  void initState() {
    super.initState();
    _filterMenuData = _loadFilterMenuJson();
    _sortMenuData = _loadSortMenuJson();
  }

  Future<List<Map<String, dynamic>>> _loadFilterMenuJson() async {
    final jsonString = await rootBundle.loadString('assets/enums/FilterMenu.json');
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    return List<Map<String, dynamic>>.from(jsonData['values'] as List);
  }

  Future<List<Map<String, dynamic>>> _loadSortMenuJson() async {
    final jsonString = await rootBundle.loadString('assets/enums/SortMenu.json');
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    return List<Map<String, dynamic>>.from(jsonData['values'] as List);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            const SizedBox(
              // text at top
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'SALE',
                    style: TextStyle(fontSize: 45),
                  ),
                  Text('Don’t miss out! Get yours before they’re all gone!'),
                  Text('All prices shown are inclusive of the discount 🛒'),
                ],
              ),
            ),
            SizedBox(
              // text at top
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('FILTER BY'), // filters
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _filterMenuData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(width: 150, child: Center(child: CircularProgressIndicator()));
                      }
                      if (snapshot.hasError) {
                        return const Text('Error loading filters');
                      }
                      final filterItems = snapshot.data ?? [];
                      return DropdownMenu<Map<String, dynamic>>(
                        hintText: 'all products',
                        dropdownMenuEntries: filterItems
                            .map<DropdownMenuEntry<Map<String, dynamic>>>((item) {
                          return DropdownMenuEntry<Map<String, dynamic>>(
                            value: item,
                            label: item['text'] as String,
                          );
                        }).toList(),
                      );
                    },
                  ),

                  const Text('SORT BY'),
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _sortMenuData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(width: 150, child: Center(child: CircularProgressIndicator()));
                      }
                      if (snapshot.hasError) {
                        return const Text('Error loading sorts');
                      }
                      final sortItems = snapshot.data ?? [];
                      return DropdownMenu<Map<String, dynamic>>(
                        hintText: 'Best Selling',
                        dropdownMenuEntries: sortItems
                            .map<DropdownMenuEntry<Map<String, dynamic>>>((item) {
                          return DropdownMenuEntry<Map<String, dynamic>>(
                            value: item,
                            label: item['text'] as String,
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              // products
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductDisplay(
                          'A5 notepad',
                          'sold out',
                          'https://shop.upsu.net/cdn/shop/products/IMG_0617_540x.jpg?v=1557218162',
                          'product description'),
                      ProductDisplay(
                          'classic sweatshirts - neutral',
                          '£̶4̶2̶.̶0̶0̶   £10.99',
                          'https://shop.upsu.net/cdn/shop/files/Neutral_-_Sept_24_540x.png?v=1750063651',
                          'product description'),
                      ProductDisplay(
                          'recycled notebook',
                          '£̶1̶2̶.̶0̶0̶   £1.80',
                          'https://shop.upsu.net/cdn/shop/products/IMG_3406_540x.jpg?v=1581000944',
                          'product description'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductDisplay(
                          'iphone 5/6 charge & sunc cable',
                          '£̶4̶2̶.̶0̶0̶  £1.50',
                          'https://shop.upsu.net/cdn/shop/products/IMG_0731_540x.jpg?v=1557218844',
                          'product description'),
                      ProductDisplay(
                          'type C charge and sync cable',
                          '£̶4̶2̶.̶0̶0̶   £1.50',
                          'https://shop.upsu.net/cdn/shop/products/IMG_0731_540x.jpg?v=1557218844',
                          'product description'),
                      ProductDisplay(
                          'USB to USB charge & sync cable',
                          '£̶1̶2̶.̶0̶0̶   £1.50',
                          'https://shop.upsu.net/cdn/shop/products/IMG_0731_540x.jpg?v=1557218844',
                          'product description'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProductDisplay(
                          'Dimple Pop Fidget Keyring',
                          '£̶3̶.̶0̶0̶   £0.99',
                          'https://shop.upsu.net/cdn/shop/files/Fidget_Keyring_540x.png?v=1719226889',
                          'product description'),
                      ProductDisplay(
                          'Nike Academy 18 tech pants',
                          '£̶4̶2̶.̶0̶0̶   £7.00',
                          'https://shop.upsu.net/cdn/shop/files/Nike_Pants_Shopify_-_Sept_24_540x.png?v=1726483797',
                          'product description'),
                      ProductDisplay(
                          'Nike Academy 18 tech pants (M)',
                          'sold out',
                          'https://shop.upsu.net/cdn/shop/files/Nike_Pants_Shopify_-_Sept_24_540x.png?v=1726483797',
                          'product description'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: placeholderCallbackForButtons,
                      child: const Icon(Icons.arrow_back)),
                  ElevatedButton(
                      onPressed: placeholderCallbackForButtons,
                      child: const Icon(Icons.arrow_forward))
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
