import 'package:flutter/material.dart';

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
              Container(
                height: 520,
                color: Colors.white,
                child: Column(
                  children: [
                    // Top banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: const Color(0xFF4d2963),
                      child: const Text(
                        'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Row( // navbar
                      children: [
                        Image.network( // union logo at left
                            'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        Container(width: 300,), // adds padding
                        TextButton( // home button
                            onPressed: placeholderCallbackForButtons,
                            child: const Text(
                              'Home'
                            ),
                          ),
                        TextButton( // shop // needs to be drop down
                            onPressed: placeholderCallbackForButtons,
                            child: const Text(
                              'Shop'
                            ),
                          ),
                        TextButton( // print shack // needs to be drop down
                            onPressed: placeholderCallbackForButtons,
                            child: const Text(
                              'The Print Shack'
                            ),
                          ),
                        TextButton( // sale
                            onPressed: placeholderCallbackForButtons,
                            child: const Text(
                              'SALE!'
                            ),
                          ),
                        TextButton( // about
                            onPressed: placeholderCallbackForButtons,
                            child: const Text(
                              'about'
                            ),
                          ),
                        TextButton( // upsu
                            onPressed: placeholderCallbackForButtons,
                            child: const Text(
                              'UPSU.net'
                            ),
                          ),
                        Container(width: 350,), // adds padding
                        IconButton( // search
                          onPressed: placeholderCallbackForButtons, 
                          icon: const Icon(Icons.search)
                        ),
                        IconButton( // account
                          onPressed: placeholderCallbackForButtons, 
                          icon: const Icon(Icons.man)
                        ),
                        IconButton( // cart
                          onPressed: placeholderCallbackForButtons, 
                          icon: const Icon(Icons.shopping_bag)
                        ),
                      ],
                    ),
                    Image.network( // banner below navbar
                      'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_720x.jpg?v=1758290534',
                      height: 440,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      // child: Column( // i dont know how i would layer text over the image, ask teach
                      //   children: [
                      //     Text(
                      //       '22'
                      //     ),
                      //     Text(
                      //       '33'
                      //     ),
                      //     Text(
                      //       '44'
                      //     ),
                      //   ]
                      // )
                  ),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}

class DisplaySection extends StatelessWidget{
  final String header_text;
  final String url;

  const DisplaySection(this.header_text, this.url);

  @override
  Widget build(BuildContext context) {
    return(
      Container(
        width: double.infinity,
        child: Column(
          children : [
            Text(header_text),
            const Row(
              children: [
                //display(),
              ]
            ),
          ]
        )
      )
    );
  }
}

class Display extends StatelessWidget{
  final String name;
  final double cost;
  final String url;

  const Display(this.name, this.cost, this.url,{super.key});

  @override
  Widget build(BuildContext context) {
    return(
      Container(
        child: Column(
          children: [
            Image.network(url,width : 100, height : 100),
            Text(name),
            //Text('£'+cost),
          ]
        )
      )
    );
  }
}