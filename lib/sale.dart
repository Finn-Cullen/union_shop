import 'package:flutter/material.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/account_login.dart';
import 'package:union_shop/main.dart';

void main() {
  runApp(const UnionShopApp());
}

enum SortMenu{
  a(text: 'featured'),
  b(text: 'best selling'),
  f(text: 'high to low'),
  i(text: 'low to high');

  const SortMenu({
    required this.text,
  });

  final String text;
}

enum FilterMenu{
  product(text: 'all products'),
  clothing(text: 'clothing'),
  merch(text: 'merchendise'),
  psut(text: 'PSUT');

  const FilterMenu({
    required this.text,
  });

  final String text;
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

class SalePage extends StatelessWidget{
  const SalePage({super.key});

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
              const SizedBox( // text at top
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('SALE',style: TextStyle(fontSize: 45),),
                    Text('Don’t miss out! Get yours before they’re all gone!'),
                    Text('All prices shown are inclusive of the discount 🛒'),
                  ],
                ),
              ),
              SizedBox( // text at top
                height: 100,
                width: 800,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('FILTER BY'), // filters
                    DropdownMenu<FilterMenu>(
                      hintText: 'all products',
                      dropdownMenuEntries: FilterMenu.values
                        .map<DropdownMenuEntry<FilterMenu>>(
                          (FilterMenu itm) {
                            return DropdownMenuEntry<FilterMenu>(
                              value: itm,
                              label: itm.text,
                            );
                        }).toList(),
                    ),

                    const Text('SORT BY'),
                    DropdownMenu<SortMenu>( // sort
                      hintText: 'Best Selling',
                      dropdownMenuEntries: SortMenu.values
                        .map<DropdownMenuEntry<SortMenu>>(
                          (SortMenu itm) {
                            return DropdownMenuEntry<SortMenu>(
                              value: itm,
                              label: itm.text,
                            );
                        }).toList(),
                    ),

                    const Text('14 products'),
                  ],
                ),
              ),
              const SizedBox( // products
                height: 1500,
                width: 1000,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Display('A5 notepad','sold out','https://shop.upsu.net/cdn/shop/products/IMG_0617_540x.jpg?v=1557218162'),
                        Display('classic sweatshirts - neutral','£10.99','https://shop.upsu.net/cdn/shop/files/Neutral_-_Sept_24_540x.png?v=1750063651'),
                        Display('recycled notebook','£1.80','https://shop.upsu.net/cdn/shop/products/IMG_3406_540x.jpg?v=1581000944'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Display('iphone 5/6 charge & sunc cable','£1.50','https://shop.upsu.net/cdn/shop/products/IMG_0731_540x.jpg?v=1557218844'),
                        Display('type C charge and sync cable','£1.50','https://shop.upsu.net/cdn/shop/products/IMG_0731_540x.jpg?v=1557218844'),
                        Display('USB to USB charge & sync cable','£1.50','https://shop.upsu.net/cdn/shop/products/IMG_0731_540x.jpg?v=1557218844'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Display('Dimple Pop Fidget Keyring','£0.99','https://shop.upsu.net/cdn/shop/files/Fidget_Keyring_540x.png?v=1719226889'),
                        Display('Nike Academy 18 tech pants','£7.00','https://shop.upsu.net/cdn/shop/files/Nike_Pants_Shopify_-_Sept_24_540x.png?v=1726483797'),
                        Display('Nike Academy 18 tech pants (M)','sold out','https://shop.upsu.net/cdn/shop/files/Nike_Pants_Shopify_-_Sept_24_540x.png?v=1726483797'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: placeholderCallbackForButtons, child: const Icon(Icons.arrow_back)),
                    const Text('page 1 of 2'),
                    ElevatedButton(onPressed: placeholderCallbackForButtons, child: const Icon(Icons.arrow_forward))
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