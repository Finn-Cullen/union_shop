import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/collections_data.dart';
import 'package:union_shop/products.dart';
import 'package:union_shop/filter_data.dart';
import 'package:union_shop/sort_data.dart';

class CollectionPage extends StatefulWidget { // needs to be statefull
  const CollectionPage({super.key});
  
  @override
  State<CollectionPage> createState() {
    return CollectionPageState();
  }
}

class CollectionPageState extends State<CollectionPage> {
  String filter = 'products';
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
    for(int disp = 0; disp < list.length && disp < tlist.length; disp++){
      if(tlist[disp].contains(filter)){
        retlist.add(list[disp]);
      }
    }
    return retlist;
  }

  List<ProductDisplay> sortproducts(List<ProductDisplay> list, List<bool> featlist, List<int> bestlist){
    List<ProductDisplay> retlist = [];

    if(sortmethod == "featured"){ // needs its own sort method
      for(int i = 0; i < list.length; i++){
        if(featlist[i]){retlist.add(list[i]);} // adds featured, skips rest
      }
    }
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

  Widget buildcoll(BuildContext context){
    List<List<String>> collectionslist = [];
    List<List<String>> taglist = [];
    List<ProductDisplay> listofproducts = [];
    List<bool> featlist = [];
    List<int> bestlist = [];
    listofproducts = Products.values.map((T) {
        collectionslist.add(T.collections);
        taglist.add(T.tags);
        featlist.add(T.featured);
        bestlist.add(T.bestselling);
        return ProductDisplay(
          T.name,
          T.cost,
          T.url,
          T.desc,
        );
    }).toList();
    List<ProductDisplay> hold = [];
    for(int i = (9*(page-1)); i < listofproducts.length && i < (9*page)+1; i++){
      hold.add(listofproducts[i]);
    }
    listofproducts = hold;
    if(collselected != ''){listofproducts = sortforcollections(listofproducts,collectionslist);} // sorts collections
    if(filter != 'products'){listofproducts = filterproducts(listofproducts,taglist);} // filters
    listofproducts = sortproducts(listofproducts,featlist,bestlist); // sorts
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
              height: 100,
              child: Center(child: Text(collselected),),
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
                        onSelected: (FilterMenu? pers){
                          setState(() {
                            if(pers != null){
                              filter = pers.text;
                            }
                          });
                        },
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
                        onSelected: (SortMenu? pers){
                          setState(() {
                            if(pers != null){
                              sortmethod = pers.text;
                            }
                          });
                        },
                    ),
                  ],
                ),
              ),


            SizedBox(
              width: double.infinity,
              child: productlist,
            ),
            // Footer
            SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: backpage, child: const Icon(Icons.arrow_back)),
                    Text('page'+ page.toString()),
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
  final String desc;

  const ProductDisplay(this.name, this.cost, this.url, this.desc,{super.key});

  void navtoprod(BuildContext context){
    prodname = name;
    produrl = url;
    prodcost = cost;
    proddesc = desc;
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