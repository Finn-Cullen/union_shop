import 'package:flutter/material.dart';
import 'package:union_shop/cart.dart';

List<CartItem> cartlist = [];

List<Widget> displist = [];

Widget cart = const Text('aaa');

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

class CartItem{
  final String name;
  final String cost;
  final String url;

  const CartItem({required this.name,required this.cost,required this.url});
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