import 'package:flutter/material.dart';
import 'package:union_shop/collection_data.dart';
import 'package:union_shop/collections_data.dart';
import 'package:union_shop/filter_data.dart';
import 'package:union_shop/sort_data.dart';
import 'package:union_shop/navigation.dart';

class CollectionPage extends StatefulWidget {
  // needs to be statefull
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() {
    return CollectionPageState();
  }
}

class CollectionPageState extends State<CollectionPage> {

  void uppage() {
    if (cd.page < 2) {
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
  Widget build(BuildContext context){
    setState(() {
      cd.buildcoll(context);
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const Navbar(),

            SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(
                child: Text(csd.collselected),
              ),
            ),
            SizedBox(
              // filters and sorts
              height: 100,
              width: 800,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('FILTER BY'), // filters
                  DropdownMenu<FilterMenu>(
                    hintText: 'all products',
                    dropdownMenuEntries: FilterMenu.values
                        .map<DropdownMenuEntry<FilterMenu>>((FilterMenu itm) {
                      return DropdownMenuEntry<FilterMenu>(
                        value: itm,
                        label: itm.text,
                      );
                    }).toList(),
                    onSelected: (FilterMenu? pers) {
                      setState(() {
                        if (pers != null) {
                          cd.filter = pers.text;
                        }
                      });
                    },
                  ),

                  const Text('SORT BY'),
                  DropdownMenu<SortMenu>(
                    // sort
                    hintText: 'Best Selling',
                    dropdownMenuEntries: SortMenu.values
                        .map<DropdownMenuEntry<SortMenu>>((SortMenu itm) {
                      return DropdownMenuEntry<SortMenu>(
                        value: itm,
                        label: itm.text,
                      );
                    }).toList(),
                    onSelected: (SortMenu? pers) {
                      setState(() {
                        if (pers != null) {
                          cd.sortmethod = pers.text;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: cd.productlist,
            ),
            // Footer
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: backpage, child: const Icon(Icons.arrow_back)),
                  Text('page${cd.page}'),
                  ElevatedButton(
                      onPressed: uppage, child: const Icon(Icons.arrow_forward))
                ],
              ),
            ),
            
            ElevatedButton(onPressed: () => reloadpage(context), child: Text('Reload Page')),

            const Footer(),
          ],
        ),
      ),
    );
  }
}