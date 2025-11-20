import 'package:flutter/material.dart';
import 'package:union_shop/cart.dart';

List cartlist = [];

List<Widget> displist = [];

Widget cart = const Text('aaa');

int persprice = PersTypes.oneline.persprice;
String persdesc = PersTypes.oneline.perstype;

List<Widget> perslineinp = [];

enum PersTypes{

  oneline(
    perstype: 'one line',
    persprice: 3,
    lineoftext: 1,
  ),
  twoline(
    perstype: 'two lines',
    persprice: 4,
    lineoftext: 2,
  ),
  threeline(
    perstype: 'three lines',
    persprice: 5,
    lineoftext: 3,
  ),
  ;

  const PersTypes({
    required this.perstype,
    required this.persprice,
    required this.lineoftext,
  });

  final String perstype;
  final int persprice;
  final int lineoftext;
}

enum TPS{

  about(
    label: 'about',
    link: '/print-shack-about',
  ),
  theprintshack(
    label: 'the print shack',
    link: '/print-shack',
  )
  ;

  const TPS({
    required this.label,
    required this.link,
  });

  final String label;
  final String link;
}

int totalnumprod(String name){ // total num of a certain product
    int num = 0;
    for(int i = 0; i < cartlist.length; i++){
      if(cartlist[i].name == name){num++;}
    }
    return num;
  }

  void instcartprod(String name, String cost, String url){ // add product
    cartlist.add(CartItem(name: name,cost:  cost,url:  url));
  }

  void instcartprodpers(String name, String cost, String url, String word){ // add product
    cartlist.add(CartItemPers(name: name,cost:  cost,url:  url,wordtype: word));
  }

  void destcartprod(String name){ // remove product
    for(int i = 0; i < cartlist.length; i++){
      if(name == cartlist[i].name){
        cartlist.removeAt(i);
        i = cartlist.length;
      }
    }
  }



  List<Widget> proddisplist(){
    List<ProductDisplayCart> list = [];

    for(int i = 0; i < cartlist.length; i++){
      list.add(ProductDisplayCart(cost: cartlist[i].cost, name: cartlist[i].name, url: cartlist[i].url,total: 0));
    }
    List<ProductDisplayCart> listfilt = [];
    for(int i = 0; i < list.length; i++){
      bool check = true;
      for(int x = i; x < list.length; x++){
        if(list[i].name == list[x].name && i != x){
          check = false;
        }
      }
      if(check){
        // no duplicates
        listfilt.add(list[i]);
      }
    }
    return listfilt;
  }

Widget buildcart(BuildContext context){
    displist = proddisplist();
    if(cartlist.isEmpty){
        // cart empty
      return(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('your cart is currently empty'),
            ElevatedButton(onPressed: () => navtocol(context),child: const Text('continue shopping',))
          ],
        )
      );
    }
    else{
      return(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () => navtocol(context),child: const Text('continue shopping',style: TextStyle(color: Colors.deepPurple),)),

              const SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 800,
                      child: Text('product'),
                    ),
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: Text('price'),
                    ),
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: Text('quantity'),
                    ),
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: Text('total'),
                    ),
                  ],
                )
              ), // text at top
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: displist
              )
            ],
          )
      );
    }
  }

  void navtocol(BuildContext context){
    Navigator.pushNamed(context, '/collections');
  }

  void perslineinpset(){
    List listtype = [];
    List listnum = [];
    int save = 0;
    PersTypes.values.map((T) {
      listtype.add(T.persprice);
      listnum.add(T.lineoftext);
    }).toList();
    for(int i = 0; i < listtype.length; i++){
      if(listtype[i] == persprice){save = i;}
    }
    List<Widget> inpfields = [];
    for(int i = 0; i < listnum[save]; i++){
      inpfields.add(
        Text('line ' + (i+1).toString()),
        //TextField()
      );
    }

    perslineinp = inpfields;
  }

class CartItem{
  final String name;
  final String cost;
  final String url;

  const CartItem({required this.name,required this.cost,required this.url});
}

class CartItemPers{
  final String name;
  final String cost;
  final String url;
  final String wordtype;

  const CartItemPers({required this.name,required this.cost,required this.url,required this.wordtype});
}

  