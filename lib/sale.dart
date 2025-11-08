import 'package:flutter/material.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/account_login.dart';

void main() {
  runApp(const UnionShopApp());
}

enum SortMenu{
  a(text: 'featured'),
  b(text: 'best selling'),
  c(text: 'alphabetically A-Z'),
  e(text: 'alphabetically Z-A'),
  f(text: 'price, high to low'),
  i(text: 'price, low to high'),
  h(text: 'Date, old to new'),
  g(text: 'Date, new to old'),
  d(text: 'PSUT');

  const SortMenu({
    required this.text,
  });

  final String text;
}

enum FilterMenu{
  prod(text: 'all products'),
  cloth(text: 'clothing'),
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

class Display extends StatelessWidget{
  final String name;
  final String cost;
  final String url;

  const Display(this.name, this.cost, this.url,{super.key});

  @override
  Widget build(BuildContext context) {
    return(
      Column(
        children: [
          Image.network(url,width : 300, height : 300,),
          Text(name,textAlign: TextAlign.left),
          Text(cost),
        ]
      )
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
