import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/about_us.dart';
import 'package:union_shop/account_login.dart';
import 'package:union_shop/placeholder.dart';
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
      home: const CollectionsPage(),
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

class CollectionsPage extends StatelessWidget{
  const CollectionsPage({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  Widget orderrowanscolumns(List<Widget> list){
    List<Widget> prod = [];
    for (int i = 0; i < list.length;){ // this function turns a list of items into a set of rows in a column
      Widget hold = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          list[i],
          list[i+1],
          list[i+2],
        ],
      );
      i += 3;
      prod.add(hold);
    }

    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: prod,);
  }

  Widget buildcoll(BuildContext context){
    final listofcollections = Collections.values.map((T) {
      return DisplayCollection(
        T.collname,
        T.displayurl,
      );
    }).toList();
    return orderrowanscolumns(listofcollections);
  }

  @override
  Widget build(BuildContext context){

    final collections = buildcoll(context);


    return
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Navbar(),
              const SizedBox( // text at top
                height: 140,
                child: Text('COLLECTIONS',style: TextStyle(fontSize: 60)),
              ),
              SizedBox( // products
                height: 3000,
                width: 1000,
                child: collections
              ),
              const Footer(),
            ],
          ),
        ),
      );
  }
}

class DisplayCollection extends StatelessWidget{
  final String name;
  final String url;

  const DisplayCollection(this.name, this.url,{super.key});

  void nav(){

  }

  @override
  Widget build(BuildContext context) {
    return(
      Container(
        width : 300,
        height : 300,
        decoration: BoxDecoration(
          image: DecorationImage(fit:BoxFit.fill ,image: NetworkImage(url))
        ),
        child: Center(child: TextButton(onPressed: nav, child: Text(name,style: const TextStyle(color: Colors.white,fontSize: 20)))),
        
      )
    );
  }
}