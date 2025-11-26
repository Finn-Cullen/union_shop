import 'package:flutter/material.dart';

CartData cd = CartData(); // this allows for the various pages to edit one class

// cart handler class
class CartData {
  List cartlist = [];
  List<Widget> displist = [];
  Widget cart = const Text('aaa');



  int totalnumprod(String name){ // total num of a certain product
    int num = 0;
    for(int i = 0; i < cartlist.length; i++){
      if(cartlist[i].name == name){num++;}
    }
    return num;
  }

  void instcartprod(String name, String cost, String url){ // add product
    String costinp = cost.split('£')[cost.split('£').length-1]; // if there is a space (I.E its a sale item)
    costinp = costinp.replaceAll('£', '');
    cartlist.add(CartItem(name: name,cost:  costinp,url:  url));
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
}

class CartItem{
  final String name;
  final String cost;
  final String url;

  const CartItem({required this.name,required this.cost,required this.url});
}

class ProductDisplayCart extends StatefulWidget {
  final String name;
  final String cost;
  final String url;
  final int total;
  const ProductDisplayCart({required this.name,required this.cost,required this.url,required this.total,super.key});

  @override
  State<ProductDisplayCart> createState() => ProductDisplayCartState();
}

class ProductDisplayCartState extends State<ProductDisplayCart> {
  late String name = '';
  late String cost = '';
  late String url = '';
  late int total = 0;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    cost = widget.cost;
    url = widget.url;
    total = widget.total;
  }

  void incrprod(String n, String c, String u, BuildContext context){
    cd.instcartprod(n, c, u);
    setState(() {
    });
  }

  void decprod(String n, BuildContext context){
    cd.destcartprod(n);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      total = cd.totalnumprod(name);
    });
    return(
      SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: Image.network(url),
            ),
            SizedBox(
              height: 100,
              width: 600,
              child: Text(name),
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: Text(cost),
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: Row(
                children: [
                  IconButton(onPressed: () => incrprod(name,cost,url,context), icon: const Icon(Icons.add)),
                  Text(total.toString()),
                  IconButton(onPressed: () => decprod(name,context), icon: const Icon(Icons.exposure_minus_1)),
                ],
              )
              
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: Text(((double.parse(cost))*total).toString()),
            ),
          ],
        )
      )
    );
  }
}