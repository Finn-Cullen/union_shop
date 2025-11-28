import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:union_shop/models/navigation.dart';
import 'package:union_shop/models/prod_display.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Navbar(),
              SizedBox(
                // text at top
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('SALE', style: TextStyle(fontSize: isMobile ? 28 : 45)),
                    const Text('Don’t miss out! Get yours before they’re all gone!'),
                    const Text('All prices shown are inclusive of the discount 🛒'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('FILTER BY'),
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
                                dropdownMenuEntries: filterItems.map<DropdownMenuEntry<Map<String, dynamic>>>((item) {
                                  return DropdownMenuEntry<Map<String, dynamic>>(value: item, label: item['text'] as String);
                                }).toList(),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
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
                                dropdownMenuEntries: sortItems.map<DropdownMenuEntry<Map<String, dynamic>>>((item) {
                                  return DropdownMenuEntry<Map<String, dynamic>>(value: item, label: item['text'] as String);
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      )
                    : Row(
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
                                dropdownMenuEntries: filterItems.map<DropdownMenuEntry<Map<String, dynamic>>>((item) {
                                  return DropdownMenuEntry<Map<String, dynamic>>(value: item, label: item['text'] as String);
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
                                dropdownMenuEntries: sortItems.map<DropdownMenuEntry<Map<String, dynamic>>>((item) {
                                  return DropdownMenuEntry<Map<String, dynamic>>(value: item, label: item['text'] as String);
                                }).toList(),
                              );
                            },
                          ),
                        ],
                      ),
              ),
              // products
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ProductDisplay('A5 notepad', 'sold out', 'assets/images/magnet_B.jpg', 'product description'),
                    ProductDisplay('classic sweatshirts - neutral', '£̶4̶2̶.̶0̶0̶   £10.99', 'assets/images/magnet_B.jpg', 'product description'),
                    ProductDisplay('recycled notebook', '£̶1̶2̶.̶0̶0̶   £1.80', 'assets/images/magnet_B.jpg', 'product description'),
                    ProductDisplay('iphone 5/6 charge & sunc cable', '£̶4̶2̶.̶0̶0̶  £1.50', 'assets/images/magnet_B.jpg', 'product description'),
                    ProductDisplay('type C charge and sync cable', '£̶4̶2̶.̶0̶0̶   £1.50', 'assets/images/magnet_B.jpg', 'product description'),
                    ProductDisplay('USB to USB charge & sync cable', '£̶1̶2̶.̶0̶0̶   £1.50', 'assets/images/magnet_B.jpg', 'product description'),
                    ProductDisplay('Dimple Pop Fidget Keyring', '£̶3̶.̶0̶0̶   £0.99', 'assets/images/magnet_B.jpg', 'product description'),
                    ProductDisplay('Nike Academy 18 tech pants', '£̶4̶2̶.̶0̶0̶   £7.00', 'assets/images/magnet_B.jpg', 'product description'),
                    ProductDisplay('Nike Academy 18 tech pants (M)', 'sold out', 'assets/images/magnet_B.jpg', 'product description'),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: placeholderCallbackForButtons, child: const Icon(Icons.arrow_back)),
                    ElevatedButton(onPressed: placeholderCallbackForButtons, child: const Icon(Icons.arrow_forward))
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      );
    });
  }
}
