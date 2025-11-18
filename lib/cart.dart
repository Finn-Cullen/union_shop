import 'package:flutter/material.dart';
import 'package:union_shop/cart_data.dart';
import 'package:union_shop/collections.dart';
import 'package:union_shop/main.dart';

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
      home: const CartPage(),
      initialRoute: '/',
      routes: {
        '/collections': (context) => const CollectionsPage(),
      },
    );
  }
}

class CartPage extends StatefulWidget { // needs to be statefull
  const CartPage({super.key});
  
  @override
  State<CartPage> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {

  Widget cart = const Text('aaa'); // placeholder widget to be overwritten

  void navtocol(BuildContext context){
    Navigator.pushNamed(context, '/collections');
  }

  List<Widget> proddisplist(){
    List<ProductDisplayCart> list = [];

    for(int i = 0; i < cartlist.length; i++){
      list.add(ProductDisplayCart(cost: cartlist[i].cost, name: cartlist[i].name, url: cartlist[i].url,total: 0,));
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
                children: proddisplist(),
              )
            ],
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      cart = buildcart(context);
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const Navbar(),


            const Text('your cart', style: TextStyle(fontSize: 40),),

            cart,

            const Footer(),
          ],
        ),
      ),
    );
  }
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

  void totalnumprod(){
    int num = 0;
    for(int i = 0; i < cartlist.length; i++){
      if(cartlist[i].name == name){num++;}
    }
    total = num;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      totalnumprod();
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
              child: Text(total.toString()),
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: Text(((int.parse(cost))*total).toString()),
            ),
          ],
        )
      )
    );
  }
}