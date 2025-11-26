import 'package:flutter/material.dart';
import 'package:union_shop/navigation.dart';
import 'package:union_shop/cart_data.dart';
import 'package:union_shop/personalise_data.dart';

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

  void incrprod(String n, String c, String u, BuildContext context) {
    cd.instcartprod(n + ' ' + pd.persdesc, c, u);
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const Navbar(),
        Image.network(
            'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
            fit: BoxFit.fill),
        const Text('Personalisation'),
        Text(pd.persprice),
        const Text('Tax included'),

        // select pers text type
        DropdownMenu<PersTypes>(
          hintText: pd.persdesc,
          dropdownMenuEntries: PersTypes.values
              .map<DropdownMenuEntry<PersTypes>>((PersTypes itm) {
            return DropdownMenuEntry<PersTypes>(
              value: itm,
              label: itm.perstype,
            );
          }).toList(),
          onSelected: (PersTypes? pers) {
            setState(() {
              if (pers != null) {
                pd.persprice = pers.persprice;
                pd.persdesc = pers.perstype;
              }
              pd.perslineinpset();
            });
          },
        ),
        Column(
          children: pd.perslineinp,
        ), // bring this forward with sir, having textfields breaks everything and is an active bug in flutter
        ElevatedButton(
            onPressed: () => incrprod(
                'Personalised shirt',
                pd.persprice.toString(),
                'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',
                context),
            child: const Text('add to cart')),
        const Footer(),
      ],
    )));
  }
}
