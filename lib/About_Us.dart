import 'package:flutter/material.dart';
import 'package:union_shop/account_login.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/sale.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'about us',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const AboutUs(),
      initialRoute: '/',
      routes: {
        '/about-us': (context) => const AboutUs(),
        '/shop': (context) => const AboutUs(),
        '/print-shack': (context) => const AboutUs(),
        '/sale': (context) => const SalePage(),
        '/search': (context) => const AboutUs(),
        '/account': (context) => const Login(),
        '/cart': (context) => const AboutUs(),
      },
    );
  }
}

class AboutUs extends StatelessWidget{
  const AboutUs({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context){
    return
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Navbar(),
              SizedBox(
                width: double.infinity,
                height: 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('About us',style: TextStyle(fontSize: 30),),
                    const Text('Welcome to the Union Shop!'),
                    Row(
                      children: [
                        const Text('We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive'),
                        TextButton(onPressed: placeholderCallbackForButtons, child: const Text('personalisation service!'))
                      ],
                    ),
                    const Text('All online purchases are available for delivery or instore collection!'),
                    const Text('We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.'),
                    const Text('Happy shopping!'),
                    const Text('The Union Shop & Reception Team​​​​​​​​​'),
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