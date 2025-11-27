import 'package:flutter/material.dart';
import 'package:union_shop/about.dart';
import 'package:union_shop/account_login.dart';
import 'package:union_shop/cart.dart';
import 'package:union_shop/collections.dart';
import 'package:union_shop/collection.dart';
import 'package:union_shop/sale.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/payment.dart';
import 'package:union_shop/the_print_shack.dart';
import 'package:union_shop/print_shack_about.dart';
import 'package:union_shop/search.dart';
import 'package:union_shop/navigation.dart';
import 'package:union_shop/prod_display.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Homepage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/about-us': (context) => const AboutUs(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/print-shack': (context) => const PrintPage(),
        '/print-shack-about': (context) => const PrintPageAbout(),
        '/sale': (context) => const SalePage(),
        '/search': (context) => const SearchPage(),
        '/account': (context) => const Login(),
        '/cart': (context) => const CartPage(),
        '/product': (context) => const ProductPage(),
        '/payment': (context) => const PayPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
          // Top banner
          Navbar(),
          Container(
              height: 600,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "assets/images/pink_hoodie.jpg"))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Essential range - over 20% off!',
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
                    const Text(
                      'over 20% off our essential range. come and grab yours while stock lasts',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    ElevatedButton(
                      // view all button
                      onPressed: placeholderCallbackForButtons,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text(
                        'browse collection',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ])),
          SizedBox(
            // ESSENTIAL RANGE ProductDisplay
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ESSENTIAL RANGE - OVER 20% OFF!',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  // images
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProductDisplay(
                        'Limited Edition Essential Zip Hoodies',
                        '£14.99',
                        'assets/images/magnet_B.jpg',
                        'product description'),
                    const ProductDisplay(
                        'Essential T-Shirt',
                        '£6.99',
                        'assets/images/magnet_C.jpg',
                        'product description')
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            // SIGNATURE RANGE ProductDisplay
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SIGNATURE RANGE',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  // images
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProductDisplay(
                        'Signiture hoodie',
                        '£32.99',
                        'assets/images/magnet_B.jpg',
                        'product description'),
                    const ProductDisplay(
                        'Signiture T-Shirt',
                        '£14.99',
                        'assets/images/magnet_B.jpg',
                        'product description')
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            // PORTSMOUTH CITY COLLECTION ProductDisplay
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'PORTSMOUTH CITY COLLECTION',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  // images
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProductDisplay(
                        'portsmouth city postcard',
                        '£1.00',
                        'assets/images/magnet_C.jpg',
                        'product description'),
                    const ProductDisplay(
                        'portsmouth city magnet',
                        'sold out',
                        'assets/images/magnet_C.jpg',
                        'product description')
                  ],
                ),
                Row(
                  // images
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProductDisplay(
                        'portsmouth city bookemark',
                        '£3.00',
                        'assets/images/magnet_B.jpg',
                        'product description'),
                    const ProductDisplay(
                        'portsmouth city Notebook',
                        '£7.50',
                        'assets/images/magnet_B.jpg',
                        'product description')
                  ],
                )
              ],
            ),
          ),
          ElevatedButton(
            // view all button
            onPressed: placeholderCallbackForButtons,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text(
              'View All',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Column(
            // our range ProductDisplay
            children: [
              const Text("Our Range"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/magnet_C.jpg',
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    'assets/images/magnet_A.jpg',
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    'assets/images/magnet_B.jpg',
                    width: 300,
                    height: 300,
                  ),
                  Image.asset(
                    'assets/images/magnet_C.jpg',
                    width: 300,
                    height: 300,
                  ),
                ],
              )
            ],
          ),
          Row(
            // personal touch section
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 200, 200, 0),
                child: Column(
                  // for all the text
                  children: [
                    const Text(
                      'Add a Personal Touch',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',
                      style: TextStyle(fontSize: 16),
                    ),
                    ElevatedButton(
                      onPressed: placeholderCallbackForButtons,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        //shape: ,
                      ),
                      child: const Text(
                        'CLICK HERE TO ADD TEXT!',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(
                'assets/images/print_shack.png',
                width: 400,
                height: 400,
              )
            ],
          ),
          Footer(),
        ])));
  }
}
