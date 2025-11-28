import 'package:flutter/material.dart';
import 'package:union_shop/models/navigation.dart';
import 'package:union_shop/repositories/cart_data.dart';
import 'package:union_shop/models/personalise_data.dart';

class PrintPage extends StatefulWidget {
  // needs to be statefull
  const PrintPage({super.key});

  @override
  State<PrintPage> createState() {
    return PrintPageState();
  }
}

class PrintPageState extends State<PrintPage> {
  PrintData pd = PrintData();

  @override
  void initState() {
    super.initState();
    pd.perslineinpset();
    pd.data = pd.loaddata();
  }

  void incrprod(String n, String c, String u, BuildContext context) {
    cd.instcartprod(n.toString(), c, u);
    Navigator.pushNamed(context, '/cart');
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
              const Navbar(),
              Image.asset('assets/images/print_shack.png', width: isMobile ? 200 : 400, height: isMobile ? 200 : 400, fit: BoxFit.cover),
              Text('Personalisation', style: TextStyle(fontSize: isMobile ? 18 : 20)),
              Text(pd.persprice),
              const Text('Tax included'),

              FutureBuilder<List<Map<String, dynamic>>>(
                future: pd.data,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(width: 150, child: Center(child: CircularProgressIndicator()));
                  }
                  if (snapshot.hasError) {
                    return const Text('Error loading data');
                  }
                  final sortItems = snapshot.data ?? [];
                  return DropdownMenu<Map<String, dynamic>>(
                    hintText: 'Best Selling',
                    dropdownMenuEntries: sortItems.map<DropdownMenuEntry<Map<String, dynamic>>>((item) {
                      return DropdownMenuEntry<Map<String, dynamic>>(value: item, label: item['perstype'] as String);
                    }).toList(),
                    onSelected: (Map<String, dynamic>? selected) {
                      if (selected != null) {
                        setState(() {
                          pd.persprice = selected['persprice'] as String;
                          pd.persdesc = selected['perstype'] as String;
                          pd.perslineinpset();
                        });
                      }
                    },
                  );
                },
              ),

              Column(children: pd.perslineinp),

              ElevatedButton(
                onPressed: () => incrprod('Personalised shirt', pd.persprice.toString(), 'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869', context),
                child: const Text('add to cart'),
              ),
              const Footer(),
            ],
          ),
        ),
      );
    });
  }
}
