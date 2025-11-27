import 'package:union_shop/prod_display.dart';
import 'package:union_shop/collections_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

CollectionData cd = CollectionData();

class CollectionData {
  String filter = 'products';
  String sortmethod = 'best selling';
  int page = 1;
  late Widget productlist = const Column();

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Widget orderrowanscolumns(List<Widget> list) {
    List<Widget> prod = []; // max number of rows is 3
    for (int i = 0; i < list.length;) {
      // this function turns a list of items into a set of rows in a column
      List<Widget> disp = [];
      disp.add(list[i]);
      if (i + 1 < list.length) {
        disp.add(list[i +
            1]); // this prevents it from grabbing index positions that are out of bounds
      }
      if (i + 2 < list.length) {
        disp.add(list[i + 2]);
      }
      Widget widg = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: disp,
      );
      i += 3;
      prod.add(widg);
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: prod);
  }

  List<ProductDisplay> sortforcollections(
      List<ProductDisplay> dlist, List<dynamic> clist) {
    List<ProductDisplay> retlist = [];
    for (int disp = 0; disp < dlist.length; disp++) {
      if (clist[disp].contains(csd.collselected)) {
        retlist.add(dlist[disp]);
      }
    }
    return retlist;
  }

  List<ProductDisplay> filterproducts(
      List<ProductDisplay> list, List<dynamic> tlist) {
    List<ProductDisplay> retlist = [];
    for (int disp = 0; disp < list.length && disp < tlist.length; disp++) {
      if (tlist[disp].contains(filter)) {
        retlist.add(list[disp]);
      }
    }
    return retlist;
  }

  List<ProductDisplay> sortproducts(
      List<ProductDisplay> list, List<dynamic> featlist, List<dynamic> bestlist) {
    List<ProductDisplay> retlist = [];

    if (sortmethod == "featured") {
      // needs its own sort method
      for (int i = 0; i < list.length; i++) {
        if (featlist[i]) {
          retlist.add(list[i]);
        } // adds featured, skips rest
      }
    } else {
      // using bubble sort to sort
      String order = 'greater'; // determines the order to be sorted by
      List vallist = []; // list of values to sort by
      if (sortmethod == "best selling") {
        order = 'lesser';
        vallist = bestlist;
      }
      if (sortmethod == "low to high" || sortmethod == "high to low") {
        for (int i = 0; i < list.length; i++) {
          String costinp = list[i].cost.split('£')[
              list[i].cost.split('£').length -
                  1]; // if there is a space (I.E its a sale item)
          costinp = costinp.replaceAll('£', '');
          vallist.add(double.parse(costinp));
        }
      }
      if (sortmethod == "high to low") {
        order = 'lesser';
      }
      bool check = true;
      while (check) {
        check = false;
        for (int i = 0; i < list.length; i++) {
          if (i + 1 < list.length) {
            if ((order == 'greater' && vallist[i] > vallist[i + 1]) ||
                (order == 'lesser' && vallist[i] < vallist[i + 1])) {
              var holda = list[i];
              list[i] = list[i + 1];
              list[i + 1] = holda;
              var holdb = vallist[i];
              vallist[i] = vallist[i + 1];
              vallist[i + 1] = holdb;
              check = true;
            }
          }
        }
      }
      retlist = list;
    }

    return retlist;
  }

  void buildcoll(BuildContext context) async {
    List<ProductDisplay> listofproducts = [];

    final map = await buildlist();
    final name = map.map((v) => v["name"]).toList();
    final cost = map.map((v) => v["cost"]).toList();
    final path = map.map((v) => v["path"]).toList();
    final desc = map.map((v) => v["desc"]).toList();

    final taglist = map.map((v) => v["tags"]).toList();
    final collectionslist = map.map((v) => v["collections"]).toList();
    final bestlist = map.map((v) => v["bestselling"]).toList();
    final featlist = map.map((v) => v["featured"]).toList();

    for(int i = 0; i < name.length; i++){
      listofproducts.add(ProductDisplay(name[i], cost[i], path[i], desc[i]));
    }

    List<ProductDisplay> hold = [];
    for (int i = (9 * (page - 1));
        i < listofproducts.length && i < (9 * page) + 1;
        i++) {
      hold.add(listofproducts[i]);
    }
    listofproducts = hold;
    if (csd.collselected != '') {
      listofproducts = sortforcollections(listofproducts, collectionslist);
    } // sorts collections
    if (filter != 'products') {
      listofproducts = filterproducts(listofproducts, taglist);
    } // filters
    listofproducts = sortproducts(listofproducts, featlist, bestlist); // sorts
    productlist = orderrowanscolumns(listofproducts);
  }

  Future<List<Map<String, dynamic>>> buildlist() async {
    final jsonstring = await loadJson();
    final data = jsonDecode(jsonstring)['values'];
    return List<Map<String, dynamic>>.from(data);
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/enums/Products.json');
  }
}
