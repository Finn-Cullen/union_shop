import 'package:flutter/material.dart';

enum TPS{

  about(
    label: 'about',
    link: '/print-shack-about',
  ),
  theprintshack(
    label: 'the print shack',
    link: '/print-shack',
  )
  ;

  const TPS({
    required this.label,
    required this.link,
  });

  final String label;
  final String link;
}

class Navbar extends StatelessWidget{
  const Navbar({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }
  
  @override
  Widget build(BuildContext context) {
    return(
      Row( // navbar
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network( // union logo at left
            'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
            fit: BoxFit.cover,
          ),
          TextButton( // home button
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
            child: const Text(
              'Home'
            ),
          ),
          TextButton( // shop // needs to be drop down
            onPressed: () => Navigator.pushNamed(context, '/collections'),
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
                Navigator.pushNamed(context, t.link);
              }
            },
          ),
          TextButton( // sale
            onPressed: () => Navigator.pushNamed(context, '/sale'),
            child: const Text(
              'SALE!'
            ),
          ),
          TextButton( // about
            onPressed: () => Navigator.pushNamed(context, '/about-us'),
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
          IconButton( // search
            onPressed: () => Navigator.pushNamed(context, '/search'), 
            icon: const Icon(Icons.search)
          ),
          IconButton( // account
            onPressed: () => Navigator.pushNamed(context, '/account'), 
            icon: const Icon(Icons.man)
          ),
          IconButton( // cart
            onPressed: () => Navigator.pushNamed(context, '/cart'), 
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
                // SizedBox(
                //   //child: TextField(decoration: InputDecoration(labelText: 'Email Address')), // turns out the row was evil, now gotta figure out how to add the button
                // )
              ],
            ),
          ],
        )
      )
    );
  }
}
