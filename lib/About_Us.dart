import 'package:flutter/material.dart';
import 'package:union_shop/account_login.dart';
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

class Navbar extends StatelessWidget{
  const Navbar({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }
  
  void navtoaboutus(BuildContext context){
    Navigator.pushNamed(context, '/about-us');
  }
  void navtoshop(BuildContext context){
    Navigator.pushNamed(context, '/shop');
  }
  void navtoprintshack(BuildContext context){
    Navigator.pushNamed(context, '/print-shack');
  }
  void navtosale(BuildContext context){
    Navigator.pushNamed(context, '/sale');
  }
  void navtosearch(BuildContext context){
    Navigator.pushNamed(context, '/search');
  }
  void navtoaccount(BuildContext context){
    Navigator.pushNamed(context, '/account');
  }
  void navtocart(BuildContext context){
    Navigator.pushNamed(context, '/cart');
  }
  void navtohome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return(
      Row( // navbar
        children: [
          // Container( // top banner breaks code
          //     width: double.infinity,
          //     padding: const EdgeInsets.symmetric(vertical: 8),
          //     color: const Color(0xFF4d2963),
          //     child: const Text(
          //     'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(color: Colors.white, fontSize: 16),
          //   ),
          // ),
          Image.network( // union logo at left
            'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
            height: 40,
            fit: BoxFit.cover,
          ),
          Container(width: 300,), // adds padding
          TextButton( // home button
            onPressed: () => navtohome(context),
            child: const Text(
              'Home'
            ),
          ),
          TextButton( // shop // needs to be drop down
            onPressed: () => navtoshop(context),
            child: const Text(
              'Shop'
            ),
          ),
          TextButton( // print shack // needs to be drop down
            onPressed: () => navtoprintshack(context),
            child: const Text(
              'The Print Shack'
            ),
          ),
          TextButton( // sale
            onPressed: () => navtosale(context),
            child: const Text(
              'SALE!'
            ),
          ),
          TextButton( // about
            onPressed: () => navtoaboutus(context),
            child: const Text(
              'about'
            ),
          ),
          TextButton( // upsu
              onPressed: placeholderCallbackForButtons, // leads no where
            child: const Text(
              'UPSU.net'
            ),
          ),
          Container(width: 350,), // adds padding
          IconButton( // search
            onPressed: () => navtosearch(context), 
            icon: const Icon(Icons.search)
          ),
          IconButton( // account
            onPressed: () => navtoaccount(context), 
            icon: const Icon(Icons.man)
          ),
          IconButton( // cart
            onPressed: () => navtocart(context), 
            icon: const Icon(Icons.shopping_bag)
          ),
        ],
      )
    );
  }
}

class Footer extends StatelessWidget{
  const Footer({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) { // vsc complains about "Another exception was thrown: Cannot hit test a render box with no size."
    return(
      Container(
        color: Colors.grey,
        height: 500,
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Opening Hours'),
                Text('PLEASE NOTE THE UNION SHOP WILL BE CLOSED ALL DAY ON 07/11/2025'),
                Text('(Term Time)'),
                Text('Monday - Friday 9am - 4pm'),
                Text('(Outside of Term Time / Consolidation Weeks)'),
                Text('Monday - Friday 10am - 3pm'),
                Text('Purchase online 24/7'),
              ],
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Help and Information'),
                Text('Search'),
                Text('Terms & Conditions of Sale Policy'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Text('Latest offerss'),
                SizedBox(
                  width: 600,
                  height: 200,
                  child: TextField(decoration: InputDecoration(labelText: 'Email Address')), // turns out the row was evil, now gotta figure out how to add the button
                )
              ],
            ),
          ],
        )
      )
    );
  }
}
