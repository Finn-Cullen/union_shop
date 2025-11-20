import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/search_data.dart';

class SearchPage extends StatefulWidget { // needs to be statefull
  const SearchPage({super.key});
  
  @override
  State<SearchPage> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {

  void searchitm(String inp){
    setState(() {
      search(inp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),

            SizedBox(
              width: 500,
              height: 300,
              child: Row(
                children: [
                  //const TextField(),
                  ElevatedButton(onPressed: () => searchitm('aw'), child: const Text('search')) // works, is using constant as a placeholder
                ],
              ),
            ),
            Column(
              children: searchlist,
            ),

            const Footer(),
          ],
        )
      )
    );
  }
}
