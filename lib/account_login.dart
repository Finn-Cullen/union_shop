import 'package:flutter/material.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/sale.dart';
import 'package:union_shop/main.dart';

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

class Login extends StatelessWidget{
  const Login({super.key});

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
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 400,
                      height: 400,
                      color: Colors.white70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network( // union logo 
                            'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                          const Text('Sign in',style: TextStyle(fontSize: 40),),
                          const Text('choose how you would like to sign in',),
                          ElevatedButton(
                            onPressed: placeholderCallbackForButtons,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 62, 11, 172),
                            ),
                            child: const Text('sign in with shop',style: TextStyle(color: Colors.white),),
                          ),
                          const Text('-------------------------------or-------------------------------'),
                          const TextField(
                            decoration: InputDecoration(labelText: 'Email')
                          ),
                          ElevatedButton(
                            onPressed: placeholderCallbackForButtons,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 198, 198, 198),
                            ),
                            child: const Text('continue',style: TextStyle(color: Color.fromARGB(255, 87, 87, 87)),),
                          ),
                        ],
                      ) 
                    )
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