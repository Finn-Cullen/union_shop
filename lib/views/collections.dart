import 'package:flutter/material.dart';
import 'package:union_shop/models/navigation.dart';
import 'package:union_shop/repositories/collections_data.dart';

class CollectionsPage extends StatefulWidget {
  // needs to be statefull
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() {
    return CollectionsPageState();
  }
}

class CollectionsPageState extends State<CollectionsPage> {

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  void reloadpage(BuildContext context) {
    setState(() {
      csd.buildcoll(context);
    });
  }

    @override
  void initState() {
    super.initState();
    csd.datalist = csd.buildlist();
  }

  @override
  Widget build(BuildContext context) {
    csd.buildcoll(context);
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Navbar(),
              SizedBox(
                // text at top
                height: isMobile ? 100 : 140,
                child: Center(child: Text('COLLECTIONS', style: TextStyle(fontSize: isMobile ? 28 : 60))),
              ),

              FutureBuilder<List<Map<String, dynamic>>>(
                future: csd.datalist,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(width: 150, child: Center(child: CircularProgressIndicator()));
                  }
                  if (snapshot.hasError) {
                    return const Text('Error loading data');
                  }
                  csd.buildcoll(context);
                  return SizedBox(width: double.infinity, child: csd.collections);
                },
              ),

              const Footer(),
            ],
          ),
        ),
      );
    });
  }
}
