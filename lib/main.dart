import 'package:flutter/material.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/account_login.dart';
import 'package:union_shop/cart.dart';
import 'package:union_shop/cart_data.dart';
import 'package:union_shop/collections.dart';
import 'package:union_shop/collection.dart';
import 'package:union_shop/sale.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/payment.dart';
import 'package:union_shop/the_print_shack.dart';
import 'package:union_shop/print_shack_about.dart';

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
      home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/about-us': (context) => const AboutUs(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/print-shack': (context) => const PrintPage(),
        '/print-shack-about': (context) => const PrintPageAbout(),
        '/sale': (context) => const SalePage(),
        '/search': (context) => const AboutUs(),
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
            children: [
              SizedBox( // navbar and banner
                height: 620,
                child: Column(
                  children: [
                    // Top banner
                    const Navbar(),
                    Container(
                      width: double.infinity,
                      height: 500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(fit:BoxFit.fill ,image: NetworkImage("https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_720x.jpg?v=1758290534"))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Essential range - over 20% off!',style: TextStyle(color: Colors.white, fontSize: 60),),
                          const Text('over 20% off our essential range. come and grab yours while stock lasts',style: TextStyle(color: Colors.white,fontSize: 32),),
                          ElevatedButton( // view all button
                            onPressed: placeholderCallbackForButtons,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                            ),
                            child: const Text(
                              'browse collection',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ]
                      )
                    )
                  ],
               ),
              ),
              SizedBox( // ESSENTIAL RANGE display
                height: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('ESSENTIAL RANGE - OVER 20% OFF!',style: TextStyle(fontSize: 20),),
                    Row( // images
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Display('Limited Edition Essential Zip Hoodies', '£14.99', 'https://shop.upsu.net/cdn/shop/files/Pink_Essential_Hoodie_2a3589c2-096f-479f-ac60-d41e8a853d04_720x.jpg?v=1749131089'),
                        Container(width: 50,),
                        const Display('Essential T-Shirt', '£6.99', 'https://shop.upsu.net/cdn/shop/files/Sage_T-shirt_720x.png?v=1759827236')
                      ],
                    )
                  ],
                ),
              ),
              SizedBox( // SIGNATURE RANGE display
                height: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('SIGNATURE RANGE',style: TextStyle(fontSize: 20),),
                    Row( // images
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Display('Signiture hoodie', '£32.99', 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
                        Container(width: 50,),
                        const Display('Signiture T-Shirt', '£14.99', 'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_720x.jpg?v=1758290534')
                      ],
                    )
                  ],
                ),
              ),
              SizedBox( // PORTSMOUTH CITY COLLECTION display
                height: 1400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('PORTSMOUTH CITY COLLECTION',style: TextStyle(fontSize: 20),),
                    Row( // images
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Display('portsmouth city postcard', '£1.00', 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_900x.jpg?v=1752232561'),
                        Container(width: 50,),
                        const Display('portsmouth city magnet', 'sold out', 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_900x.jpg?v=1752230282')
                      ],
                    ),
                    Row( // images
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Display('portsmouth city bookemark', '£3.00', 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityBookmark1_900x.jpg?v=1752230004'),
                        Container(width: 50,),
                        const Display('portsmouth city Notebook', '£7.50', 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityNotebook_900x.jpg?v=1757419215')
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton( // view all button
                onPressed: placeholderCallbackForButtons,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'View All',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Column( // our range display
                children: [
                  const Text("Our Range"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network('https://shop.upsu.net/cdn/shop/files/PurpleHoodieFinal_540x.jpg?v=1742201957',width: 300,height: 300,),
                      Image.network('https://shop.upsu.net/cdn/shop/products/IMG_0651_540x.jpg?v=1557218799',width: 300,height: 300,),
                      Image.network('https://shop.upsu.net/cdn/shop/products/GradGrey_540x.jpg?v=1657288025',width: 300,height: 300,),
                      Image.network('https://shop.upsu.net/cdn/shop/products/IMG_0617_540x.jpg?v=1557218162',width: 300,height: 300,),
                    ],
                  )
                ],
              ),
              Row(// personal touch section
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: 650,
                    padding: const EdgeInsets.fromLTRB(0, 200, 200, 0) ,
                    child: Column( // for all the text
                      children: [
                        const Text('Add a Personal Touch',style: TextStyle(fontSize: 20),),
                        const Text('First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',style: TextStyle(fontSize: 16),),
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
                  Image.network('https://shop.upsu.net/cdn/shop/files/The_Union_Print_Shack_Logo_-_smaller_540x.png?v=1760532830',width: 400,height: 400,)
                ],
              ),
              const Footer(),
            ]
          )
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
    Navigator.pushNamed(context, '/collections');
  }
  void navtoprintshack(BuildContext context,String link){
    Navigator.pushNamed(context, link);
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
          DropdownMenu<TPS>(
            hintText: 'the print shack',
            dropdownMenuEntries: TPS.values
            .map<DropdownMenuEntry<TPS>>(
              (TPS itm) {
                return DropdownMenuEntry<TPS>(
                  value: itm,
                  label: itm.label,
                );
            }).toList(),
            onSelected: (TPS? t){
              if(t != null){
                navtoprintshack(context,t.link);
              }
              perslineinpset();
            },
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