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

  void updatepage(){
    setState(() {
      displist = proddisplist();
      cart = buildcart(context);
    });
  }

  void navtopay(BuildContext context){
    Navigator.pushNamed(context, '/payment');
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      displist = proddisplist();
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

            ElevatedButton(onPressed: updatepage, child: const Text('update page')),

            ElevatedButton(onPressed: () => navtopay(context), child: const Text('pay')),

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

  void incrprod(String n, String c, String u, BuildContext context){
    instcartprod(n, c, u);
    setState(() {
    });
  }

  void decprod(String n, BuildContext context){
    destcartprod(n);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      total = totalnumprod(name);
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
              child: Text(((int.parse(cost))*total).toString()),
            ),
          ],
        )
      )
    );
  }
}