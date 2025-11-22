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
  TextEditingController controller = TextEditingController();

  void searchitm(String inp){
    setState(() {
      search(inp);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(),
            SizedBox(height: 100,),
            TextField(controller: controller),
            ElevatedButton(onPressed: () => searchitm(controller.text), child: const Text('search')), // works, is using constant as a placeholder
            SizedBox(height: 100,),
            Column(
              children: searchlist,
            ),
            SizedBox(height: 100,),
            Footer(),
          ],
        )
      ),
    );
  }
}
