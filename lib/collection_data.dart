import 'package:union_shop/prod_display.dart';
import 'package:union_shop/products.dart';
import 'package:union_shop/collections_data.dart';
import 'package:flutter/material.dart';

class CollectionData {
  String filter = 'products';
  String sortmethod = 'best selling';
  int page = 1;
  Widget productlist = const Column();

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
      List<ProductDisplay> dlist, List<List<String>> clist) {
    List<ProductDisplay> retlist = [];
    for (int disp = 0; disp < dlist.length; disp++) {
      if (clist[disp].contains(csd.collselected)) {
        retlist.add(dlist[disp]);
      }
    }
    return retlist;
  }

  List<ProductDisplay> filterproducts(
      List<ProductDisplay> list, List<List<String>> tlist) {
    List<ProductDisplay> retlist = [];
    for (int disp = 0; disp < list.length && disp < tlist.length; disp++) {
      if (tlist[disp].contains(filter)) {
        retlist.add(list[disp]);
      }
    }
    return retlist;
  }

  List<ProductDisplay> sortproducts(
      List<ProductDisplay> list, List<bool> featlist, List<int> bestlist) {
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

  Widget buildcoll(BuildContext context) {
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
    return orderrowanscolumns(listofproducts);
  }
}
