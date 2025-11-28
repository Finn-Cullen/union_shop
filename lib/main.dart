import 'package:flutter/material.dart';
import 'package:union_shop/views/about.dart';
import 'package:union_shop/views/account_login.dart';
import 'package:union_shop/views/cart.dart';
import 'package:union_shop/views/collections.dart';
import 'package:union_shop/views/collection.dart';
import 'package:union_shop/views/sale.dart';
import 'package:union_shop/views/product_page.dart';
import 'package:union_shop/views/payment.dart';
import 'package:union_shop/views/the_print_shack.dart';
import 'package:union_shop/views/print_shack_about.dart';
import 'package:union_shop/views/search.dart';
import 'package:union_shop/models/navigation.dart';
import 'package:union_shop/models/prod_display.dart';

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
      body: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final heroHeight = isMobile ? 400.0 : 600.0;

        Widget productRow(List<Widget> items) {
          // Use a Wrap so items flow on small screens
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: items,
          );
        }

        final productWidth = isMobile ? 160.0 : 300.0;

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Top banner
              Navbar(),
              Container(
                height: heroHeight,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/pink_hoodie.jpg"),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Essential range - over 20% off!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 28 : 60,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'over 20% off our essential range. come and grab yours while stock lasts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 14 : 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: placeholderCallbackForButtons,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text(
                        'browse collection',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              // ESSENTIAL RANGE
              Padding(
                padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 20),
                child: Column(
                  children: [
                    Text(
                      'ESSENTIAL RANGE - OVER 20% OFF!',
                      style: TextStyle(fontSize: isMobile ? 16 : 20),
                    ),
                    const SizedBox(height: 8),
                    productRow([
                      SizedBox(
                        width: productWidth,
                        child: ProductDisplay(
                            'Limited Edition Essential Zip Hoodies',
                            '£14.99',
                            'assets/images/magnet_B.jpg',
                            'product description'),
                      ),
                      SizedBox(
                        width: productWidth,
                        child: ProductDisplay(
                            'Essential T-Shirt',
                            '£6.99',
                            'assets/images/magnet_C.jpg',
                            'product description'),
                      ),
                    ]),
                  ],
                ),
              ),

              // SIGNATURE RANGE
              Padding(
                padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 20),
                child: Column(
                  children: [
                    Text('SIGNATURE RANGE', style: TextStyle(fontSize: isMobile ? 16 : 20)),
                    const SizedBox(height: 8),
                    productRow([
                      SizedBox(
                        width: productWidth,
                        child: ProductDisplay(
                            'Signiture hoodie',
                            '£32.99',
                            'assets/images/magnet_B.jpg',
                            'product description'),
                      ),
                      SizedBox(
                        width: productWidth,
                        child: ProductDisplay(
                            'Signiture T-Shirt',
                            '£14.99',
                            'assets/images/magnet_B.jpg',
                            'product description'),
                      ),
                    ]),
                  ],
                ),
              ),

              // PORTSMOUTH CITY COLLECTION
              Padding(
                padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 20),
                child: Column(
                  children: [
                    Text('PORTSMOUTH CITY COLLECTION', style: TextStyle(fontSize: isMobile ? 16 : 20)),
                    const SizedBox(height: 8),
                    productRow([
                      SizedBox(
                        width: productWidth,
                        child: ProductDisplay(
                            'portsmouth city postcard',
                            '£1.00',
                            'assets/images/magnet_C.jpg',
                            'product description'),
                      ),
                      SizedBox(
                        width: productWidth,
                        child: ProductDisplay(
                            'portsmouth city magnet',
                            'sold out',
                            'assets/images/magnet_C.jpg',
                            'product description'),
                      ),
                    ]),
                    const SizedBox(height: 12),
                    productRow([
                      SizedBox(
                        width: productWidth,
                        child: ProductDisplay(
                            'portsmouth city bookemark',
                            '£3.00',
                            'assets/images/magnet_B.jpg',
                            'product description'),
                      ),
                      SizedBox(
                        width: productWidth,
                        child: ProductDisplay(
                            'portsmouth city Notebook',
                            '£7.50',
                            'assets/images/magnet_B.jpg',
                            'product description'),
                      ),
                    ]),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: placeholderCallbackForButtons,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'View All',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              // Our Range images
              Padding(
                padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 24),
                child: Column(
                  children: [
                    const Text("Our Range"),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        Image.asset('assets/images/magnet_C.jpg', width: isMobile ? 150 : 300, height: isMobile ? 150 : 300),
                        Image.asset('assets/images/magnet_A.jpg', width: isMobile ? 150 : 300, height: isMobile ? 150 : 300),
                        Image.asset('assets/images/magnet_B.jpg', width: isMobile ? 150 : 300, height: isMobile ? 150 : 300),
                        Image.asset('assets/images/magnet_C.jpg', width: isMobile ? 150 : 300, height: isMobile ? 150 : 300),
                      ],
                    ),
                  ],
                ),
              ),

              // personal touch section
              Padding(
                padding: EdgeInsets.symmetric(vertical: isMobile ? 12 : 40, horizontal: isMobile ? 12 : 40),
                child: isMobile
                    ? Column(
                        children: [
                          Column(
                            children: [
                              Text('Add a Personal Touch', style: TextStyle(fontSize: isMobile ? 18 : 20)),
                              const SizedBox(height: 8),
                              Text(
                                'First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',
                                style: TextStyle(fontSize: isMobile ? 12 : 16),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: placeholderCallbackForButtons,
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                                child: const Text('CLICK HERE TO ADD TEXT!', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Image.asset('assets/images/print_shack.png', width: isMobile ? 200 : 400, height: isMobile ? 200 : 400),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 200, 200, 0),
                            child: Column(
                              children: [
                                const Text('Add a Personal Touch', style: TextStyle(fontSize: 20)),
                                const Text(
                                  'First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',
                                  style: TextStyle(fontSize: 16),
                                ),
                                ElevatedButton(
                                  onPressed: placeholderCallbackForButtons,
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                                  child: const Text('CLICK HERE TO ADD TEXT!', style: TextStyle(color: Colors.white)),
                                )
                              ],
                            ),
                          ),
                          Image.asset('assets/images/print_shack.png', width: 400, height: 400),
                        ],
                      ),
              ),

              Footer(),
            ],
          ),
        );
      }),
    );
  }
}
