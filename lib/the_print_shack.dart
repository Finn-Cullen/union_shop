import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/cart_data.dart';

class PrintPage extends StatefulWidget { // needs to be statefull
  const PrintPage({super.key});
  
  @override
  State<PrintPage> createState() {
    return PrintPageState();
  }
}

class PrintPageState extends State<PrintPage> {

  void incrprod(String n, String c, String u, BuildContext context){
    
    instcartprodpers(persdesc, c, u,n);
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      perslineinpset();
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(

                  child: Image.network('https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869',fit: BoxFit.fill),
                ),
                SizedBox(
                  height: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Personalisation'),
                      Text('£' + persprice.toString() + '.00'),
                      const Text('Tax included'),

                      // select pers text type
                      DropdownMenu<PersTypes>(
                        hintText: persdesc,
                        dropdownMenuEntries: PersTypes.values
                          .map<DropdownMenuEntry<PersTypes>>(
                            (PersTypes itm) {
                              return DropdownMenuEntry<PersTypes>(
                                value: itm,
                                label: itm.perstype,
                              );
                          }).toList(),
                        onSelected: (PersTypes? pers){
                          setState(() {
                            if(pers != null){
                              persprice = pers.persprice;
                              persdesc = pers.perstype;
                            }
                            perslineinpset();
                          });
                        },
                      ),
                      Column(children: perslineinp,), // bring this forward with sir, having textfields breaks everything and is an active bug in flutter

                      ElevatedButton(onPressed: () => incrprod('Personalised shirt', persprice.toString(), 'https://shop.upsu.net/cdn/shop/products/Personalised_Image_1024x1024@2x.jpg?v=1562949869', context), child: const Text('add to cart'))
                    ],
                  ),
                )
              ],
            ),

            const Footer(),
          ],
        )
      )
    );
  }
}
