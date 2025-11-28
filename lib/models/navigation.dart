import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late Future<List<Map<String, dynamic>>> _tpsData;

  @override
  void initState() {
    super.initState();
    _tpsData = _loadTpsJson();
  }

  Future<List<Map<String, dynamic>>> _loadTpsJson() async {
    final jsonString = await rootBundle.loadString('assets/enums/TPS.json');
    final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
    return List<Map<String, dynamic>>.from(jsonData['values'] as List);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return (Row(
      // navbar
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          // union logo at left
          'assets/images/logo.png',
          fit: BoxFit.cover,
        ),
        TextButton(
          // home button
          onPressed: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
          child: const Text('Home'),
        ),
        TextButton(
          // shop // needs to be drop down
          onPressed: () => Navigator.pushNamed(context, '/collections'),
          child: const Text('Shop'),
        ),
        FutureBuilder<List<Map<String, dynamic>>>(
          future: _tpsData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                width: 150,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return const Text('Error loading menu');
            }
            final tpsItems = snapshot.data ?? [];
            return DropdownMenu<Map<String, dynamic>>(
              hintText: 'the print shack',
              dropdownMenuEntries: tpsItems
                  .map<DropdownMenuEntry<Map<String, dynamic>>>((item) {
                return DropdownMenuEntry<Map<String, dynamic>>(
                  value: item,
                  label: item['label'] as String,
                );
              }).toList(),
              onSelected: (Map<String, dynamic>? selected) {
                if (selected != null) {
                  Navigator.pushNamed(context, selected['link'] as String);
                }
              },
            );
          },
        ),
        TextButton(
          // sale
          onPressed: () => Navigator.pushNamed(context, '/sale'),
          child: const Text('SALE!'),
        ),
        TextButton(
          // about
          onPressed: () => Navigator.pushNamed(context, '/about-us'),
          child: const Text('about'),
        ),
        TextButton(
          // upsu
          onPressed: placeholderCallbackForButtons, // leads no where
          child: const Text('UPSU.net'),
        ),
        IconButton(
            // search
            onPressed: () => Navigator.pushNamed(context, '/search'),
            icon: const Icon(Icons.search)),
        IconButton(
            // account
            onPressed: () => Navigator.pushNamed(context, '/account'),
            icon: const Icon(Icons.man)),
        IconButton(
            // cart
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            icon: const Icon(Icons.shopping_bag)),
      ],
    ));
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    // vsc complains about "Another exception was thrown: Cannot hit test a render box with no size."
    return (Container(
        color: Colors.grey,
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Opening Hours'),
                Text(
                    'PLEASE NOTE THE UNION SHOP WILL BE CLOSED ALL DAY ON 07/11/2025'),
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
        )));
  }
}
