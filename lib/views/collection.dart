import 'package:flutter/material.dart';
import 'package:union_shop/repositories/collection_data.dart';
import 'package:union_shop/repositories/collections_data.dart';
import 'package:union_shop/models/navigation.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class CollectionPage extends StatefulWidget {
  // needs to be statefull
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() {
    return CollectionPageState();
  }
}

class CollectionPageState extends State<CollectionPage> {
  late Future<List<Map<String, dynamic>>> _filterMenuData;
  late Future<List<Map<String, dynamic>>> _sortMenuData;

  void uppage() {
    if (cd.page <= cd.pagelimit) {
      setState(() {
        cd.page++;
      });
    }
  }

  void backpage() {
    if (cd.page > 1) {
      setState(() {
        cd.page--;
      });
    }
  }

  void reloadpage(BuildContext context) {
    setState(() {
      cd.buildcoll(context);
    });
  }

  @override
  void initState() {
    super.initState();
    _filterMenuData = _loadFilterMenuJson();
    _sortMenuData = _loadSortMenuJson();
    cd.datalist = cd.buildlist();
  }

  Future<List<Map<String, dynamic>>> _loadFilterMenuJson() async {
    final jsonString =
        await rootBundle.loadString('assets/enums/FilterMenu.json');
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    return List<Map<String, dynamic>>.from(jsonData['values'] as List);
  }

  Future<List<Map<String, dynamic>>> _loadSortMenuJson() async {
    final jsonString =
        await rootBundle.loadString('assets/enums/SortMenu.json');
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    return List<Map<String, dynamic>>.from(jsonData['values'] as List);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      cd.buildcoll(context);
    });
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 800;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Header
              const Navbar(),

              SizedBox(
                width: double.infinity,
                height: isMobile ? 80 : 100,
                child: Center(
                  child: Text(csd.collselected,
                      style: TextStyle(fontSize: isMobile ? 18 : 20)),
                ),
              ),

              // Filters / Sort - stack vertically on small screens
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
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox(
                                    width: 150,
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              }
                              if (snapshot.hasError) {
                                return const Text('Error loading filters');
                              }
                              final filterItems = snapshot.data ?? [];
                              return DropdownMenu<Map<String, dynamic>>(
                                hintText: 'all products',
                                dropdownMenuEntries: filterItems.map<
                                    DropdownMenuEntry<
                                        Map<String, dynamic>>>((item) {
                                  return DropdownMenuEntry<
                                          Map<String, dynamic>>(
                                      value: item,
                                      label: item['text'] as String);
                                }).toList(),
                                onSelected: (Map<String, dynamic>? value) {
                                  setState(() {
                                    cd.filter = value?['text'] as String;
                                    cd.buildcoll(context);
                                  });
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          const Text('SORT BY'),
                          FutureBuilder<List<Map<String, dynamic>>>(
                            future: _sortMenuData,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox(
                                    width: 150,
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              }
                              if (snapshot.hasError) {
                                return const Text('Error loading sorts');
                              }
                              final sortItems = snapshot.data ?? [];
                              return DropdownMenu<Map<String, dynamic>>(
                                hintText: 'Best Selling',
                                dropdownMenuEntries: sortItems.map<
                                    DropdownMenuEntry<
                                        Map<String, dynamic>>>((item) {
                                  return DropdownMenuEntry<
                                          Map<String, dynamic>>(
                                      value: item,
                                      label: item['text'] as String);
                                }).toList(),
                                onSelected: (Map<String, dynamic>? value) {
                                  setState(() {
                                    cd.sortmethod = value?['text'] as String;
                                    cd.buildcoll(context);
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('FILTER BY'),
                          FutureBuilder<List<Map<String, dynamic>>>(
                            future: _filterMenuData,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox(
                                    width: 150,
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              }
                              if (snapshot.hasError) {
                                return const Text('Error loading filters');
                              }
                              final filterItems = snapshot.data ?? [];
                              return DropdownMenu<Map<String, dynamic>>(
                                hintText: 'all products',
                                dropdownMenuEntries: filterItems.map<
                                    DropdownMenuEntry<
                                        Map<String, dynamic>>>((item) {
                                  return DropdownMenuEntry<
                                          Map<String, dynamic>>(
                                      value: item,
                                      label: item['text'] as String);
                                }).toList(),
                                onSelected: (Map<String, dynamic>? value) {
                                  setState(() {
                                    cd.filter = value?['text'] as String;
                                    cd.buildcoll(context);
                                  });
                                },
                              );
                            },
                          ),
                          const Text('SORT BY'),
                          FutureBuilder<List<Map<String, dynamic>>>(
                            future: _sortMenuData,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox(
                                    width: 150,
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              }
                              if (snapshot.hasError) {
                                return const Text('Error loading sorts');
                              }
                              final sortItems = snapshot.data ?? [];
                              return DropdownMenu<Map<String, dynamic>>(
                                hintText: 'Best Selling',
                                dropdownMenuEntries: sortItems.map<
                                    DropdownMenuEntry<
                                        Map<String, dynamic>>>((item) {
                                  return DropdownMenuEntry<
                                          Map<String, dynamic>>(
                                      value: item,
                                      label: item['text'] as String);
                                }).toList(),
                                onSelected: (Map<String, dynamic>? value) {
                                  setState(() {
                                    cd.sortmethod = value?['text'] as String;
                                    cd.buildcoll(context);
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
              ),

              FutureBuilder<List<Map<String, dynamic>>>(
                future: cd.datalist,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                        width: 150,
                        child: Center(child: CircularProgressIndicator()));
                  }
                  if (snapshot.hasError) {
                    return const Text('Error loading data');
                  }
                  cd.buildcoll(context);
                  return SizedBox(
                      width: double.infinity, child: cd.productlist);
                },
              ),
              // Footer / pagination
              SizedBox(
                height: isMobile ? 120 : 200,
                child: isMobile
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: backpage,
                                      child: const Icon(Icons.arrow_back)),
                                  const SizedBox(width: 12),
                                  Text('page${cd.page}'),
                                  const SizedBox(width: 12),
                                  ElevatedButton(
                                      onPressed: uppage,
                                      child: const Icon(Icons.arrow_forward)),
                                ])
                          ])
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: backpage,
                              child: const Icon(Icons.arrow_back)),
                          Text('page${cd.page}'),
                          ElevatedButton(
                              onPressed: uppage,
                              child: const Icon(Icons.arrow_forward))
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
