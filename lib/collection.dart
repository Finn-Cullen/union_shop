import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/account_login.dart';
import 'package:union_shop/collections_data.dart';
import 'package:union_shop/products.dart';
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

class CollectionPage extends StatefulWidget { // needs to be statefull
  const CollectionPage({super.key});
  
  @override
  State<CollectionPage> createState() {
    return CollectionPageState();
  }
}

class CollectionPageState extends State<CollectionPage> {
  String filter = 'all products';
  String sortmethod = 'best selling';
  int page = 1;
  Widget productlist = const Column();

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Widget orderrowanscolumns(List<Widget> list){
    List<Widget> prod = []; // max number of rows is 3
    for (int i = 0; i < list.length;){ // this function turns a list of items into a set of rows in a column
      List<Widget> disp = [];
      disp.add(list[i]);
      if(i+1 < list.length){
        disp.add(list[i+1]); // this prevents it from grabbing index positions that are out of bounds
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

  List<ProductDisplay> sortforcollections(List<ProductDisplay> dlist,List<List<String>> clist){
    List<ProductDisplay> retlist = [];
    for(int disp = 0; disp < dlist.length; disp++){
      if(clist[disp].contains(collselected)){
        retlist.add(dlist[disp]);
      }
    }
    return retlist;
  }

  List<ProductDisplay> filterproducts(List<ProductDisplay> list,List<List<String>> tlist){
    List<ProductDisplay> retlist = [];
    for(int i = 0; i < tlist.length; i++){
      if(tlist[i].contains(filter)){
        retlist.add(list[i]);
      }
    }
    return retlist;
  }

  List<ProductDisplay> sortproducts(List<ProductDisplay> list, List<bool> featlist, List<int> bestlist, List<String> datelist){
    List<ProductDisplay> retlist = [];

    if(sortmethod == "featured"){ // needs its own sort method
      for(int i = 0; i < list.length; i++){
        if(featlist[i]){retlist.add(list[i]);} // adds featured, skips rest
      }
    }
    // else if(sortmethod == "A-Z" || sortmethod == "Z-A"){
    //   String order = 'greater';
    //   List vallist = [];
    //   if(sortmethod == "Z-A"){order = 'lesser';} // ordering by letters doesnt work

    //   for(int i = 0; i < list.length; i++){
    //     vallist.add(list[i].name);
    //   }

    //   bool check = true;
    //   while(check){
    //     check = false;

    //     for(int i = 0; i < list.length; i++){
    //       if(i+1 < list.length){
    //         if(stringval(vallist[i],vallist[i+1],order)){
    //           var holda = list[i];
    //           list[i] = list[i+1];
    //           list[i+1] = holda;
    //           var holdb = vallist[i];
    //           vallist[i] = vallist[i+1];
    //           vallist[i+1] = holdb;
    //           check = true;
    //         }
    //       }
    //     }

    //   }
    //   retlist = list;
    // }
    else{
      // using bubble sort to sort
      String order = 'greater'; // determines the order to be sorted by
      List vallist = []; // list of values to sort by
      if(sortmethod == "best selling"){
        order = 'lesser';
        vallist = bestlist;
      }
      if(sortmethod == "low to high" || sortmethod == "high to low"){
        for(int i = 0; i < list.length; i++){
          vallist.add(int.parse(list[i].cost));
        }
      }
      if(sortmethod == "high to low"){order = 'lesser';}
      if(sortmethod == "oldest to newest" || sortmethod == "newest to oldest"){
        for(int i = 0; i < list.length; i++){
          List<String> date = datelist[i].split('/');
          int days = int.parse(date[0]);
          days += int.parse(date[1]) * 30;
          days += int.parse(date[2])*365; // this gives us the number of days which we can use to easily order the products
          vallist.add(days);
        }
      }
      if(sortmethod == "oldest to newest"){
        order = "lesser";
      }
      bool check = true;
      while(check){
        check = false;
        for(int i = 0; i < list.length; i++){
          if(i+1 < list.length){
            if((order == 'greater' && vallist[i] > vallist[i+1]) || (order == 'lesser' && vallist[i] < vallist[i+1])){
              var holda = list[i];
              list[i] = list[i+1];
              list[i+1] = holda;
              var holdb = vallist[i];
              vallist[i] = vallist[i+1];
              vallist[i+1] = holdb;
              check = true;
            }
          }
        }
      }
      retlist = list;
    }

    return retlist;
  }

  void uppage(){
    if(page < 2){
      setState(() {
        page++;
      });
    }
  }

  void backpage(){
    if(page > 1){
      setState(() {
        page--;
      });
    }
  }

  // bool stringval(String str1, String str2, String order){
  //   for(int i = 0; i < str1.length; i++){
  //     if(str1[i] == str2[i]){} // skips if they are equal
  //     else if((order == 'greater' && strtoint(str1[i]) > strtoint(str2[i])) || (order == 'lesser' && strtoint(str1[i]) < strtoint(str2[i]))){
  //       return true;
  //     }
  //   }
  //   return false;
  // }

  // int strtoint(String str){
  //   return str.codeUnitAt(0);
  // }

  Widget buildcoll(BuildContext context){
    List<List<String>> collectionslist = [];
    List<List<String>> taglist = [];
    List<ProductDisplay> listofproducts = [];
    List<bool> featlist = [];
    List<int> bestlist = [];
    List<String> datelist = [];
    listofproducts = Products.values.map((T) {
        collectionslist.add(T.collections);
        taglist.add(T.tags);
        featlist.add(T.featured);
        bestlist.add(T.bestselling);
        datelist.add(T.date);
        return ProductDisplay(
          T.name,
          T.cost,
          T.url,
        );
    }).toList();
    List<ProductDisplay> hold = [];
    for(int i = (9*(page-1)); i < listofproducts.length && i < (9*page)+1; i++){
      hold.add(listofproducts[i]);
    }
    listofproducts = hold;
    if(collselected != ''){listofproducts = sortforcollections(listofproducts,collectionslist);} // sorts collections
    if(filter != 'all products'){listofproducts = filterproducts(listofproducts,taglist);} // filters
    listofproducts = sortproducts(listofproducts,featlist,bestlist,datelist); // sorts
    return orderrowanscolumns(listofproducts);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      productlist = buildcoll(context);
    });

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
            SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: backpage, child: const Icon(Icons.arrow_back)),
                    Text('page'+ page.toString() +'of 2'),
                    ElevatedButton(onPressed: uppage, child: const Icon(Icons.arrow_forward))
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
          Text('£' + cost + '.00'),
        ]
      )
    );
  }
}