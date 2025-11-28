import 'package:flutter/material.dart';
import 'package:union_shop/models/navigation.dart';
import 'package:union_shop/repositories/search_data.dart';

class SearchPage extends StatefulWidget {
  // needs to be statefull
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  SearchData sd = SearchData();

  void searchitm(String inp) {
    setState(() {
      sd.search(inp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Navbar(),
              SizedBox(height: isMobile ? 40 : 100),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 80),
                child: TextField(controller: controller),
              ),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => searchitm(controller.text), child: const Text('search')),
              SizedBox(height: isMobile ? 40 : 100),
              Column(children: sd.searchlist),
              SizedBox(height: isMobile ? 40 : 100),
              Footer(),
            ],
          ),
        ),
      );
    });
  }
}
