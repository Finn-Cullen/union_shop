import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/account_login.dart';
import 'package:union_shop/placeholder.dart';
import 'package:union_shop/sale.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const CollectionPage(),
      initialRoute: '/',
      routes: {
        '/product': (context) => const ProductPage(),
        '/about-us': (context) => const AboutUs(),
        '/shop': (context) => const AboutUs(),
        '/print-shack': (context) => const AboutUs(),
        '/sale': (context) => const SalePage(),
        '/search': (context) => const AboutUs(),
        '/account': (context) => const Login(),
        '/cart': (context) => const AboutUs(),
      },
    );
  }
}

class CollectionPage extends StatelessWidget {
    const CollectionPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Widget orderrowanscolumns(List<Widget> list){
    List<Widget> prod = [];
    for (int i = 0; i < list.length;){ // this function turns a list of items into a set of rows in a column
      List<Widget> disp = [];
      disp.add(list[i]);
      if(i+1 < list.length){
        disp.add(list[i+1]);
      }
      if(i+2 < list.length){
        disp.add(list[i+2]);
      }
      Widget widg = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: disp,
      );
      i += 3;
      prod.add(widg);
    }

    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: prod);
  }

  List<Widget> sortforcollections(List<Widget> dlist,List<List<String>> tlist){
    List<Widget> retlist = [];
    for(int disp = 0; disp < dlist.length; disp++){
      bool check = false;
      for(int coll = 0; coll < tlist[disp].length; coll++){
        if(tlist[disp][coll] == collselected){check = true;}
      }
      if(check){retlist.add(dlist[disp]);}
    }
    return retlist;
  }

  Widget buildcoll(BuildContext context){
    List<List<String>> collectionslist = [];
    List<Widget> listofproducts = [];
    listofproducts = Products.values.map((T) {
      collectionslist.add(T.collections);
      return ProductDisplay(
        T.name,
        T.cost,
        T.url,
      );
    }).toList();
    listofproducts = sortforcollections(listofproducts,collectionslist);
    return orderrowanscolumns(listofproducts);
  }

  @override
  Widget build(BuildContext context) {
    final productlist = buildcoll(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const Navbar(),
            
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Text(collselected),
            ),
            SizedBox( // filters and sorts
                height: 100,
                width: 800,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('FILTER BY'), // filters
                    DropdownMenu<FilterMenu>(
                      hintText: 'all products',
                      dropdownMenuEntries: FilterMenu.values
                        .map<DropdownMenuEntry<FilterMenu>>(
                          (FilterMenu itm) {
                            return DropdownMenuEntry<FilterMenu>(
                              value: itm,
                              label: itm.text,
                            );
                        }).toList(),
                    ),

                    const Text('SORT BY'),
                    DropdownMenu<SortMenu>( // sort
                      hintText: 'Best Selling',
                      dropdownMenuEntries: SortMenu.values
                        .map<DropdownMenuEntry<SortMenu>>(
                          (SortMenu itm) {
                            return DropdownMenuEntry<SortMenu>(
                              value: itm,
                              label: itm.text,
                            );
                        }).toList(),
                    ),

                    const Text('14 products'),
                  ],
                ),
              ),

            SizedBox(
              width: double.infinity,
              height: 3000,
              child: productlist,
            ),
            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class ProductDisplay extends StatelessWidget{
  final String name;
  final String cost;
  final String url;

  const ProductDisplay(this.name, this.cost, this.url,{super.key});

  void navtoprod(BuildContext context){
    prodname = name;
    produrl = url;
    Navigator.pushNamed(context, '/product');
  }

  @override
  Widget build(BuildContext context) {
    return(
      Column(
        children: [
          Image.network(url,width : 500, height : 500,),
          TextButton(
            onPressed : () => navtoprod(context),
            child: Text(name,textAlign: TextAlign.left),
          ),
          Text(cost),
        ]
      )
    );
  }
}