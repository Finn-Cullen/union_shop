import 'package:flutter/material.dart';
import 'package:union_shop/models/products.dart';

class ProductDisplay extends StatelessWidget {
  final String name;
  final String cost;
  final String path;
  final String desc;

  const ProductDisplay(this.name, this.cost, this.path, this.desc, {super.key});

  void navtoprod(BuildContext context) {
    if (cost.toLowerCase() != 'sold out') {
      pd.prodname = name;
      pd.prodpath = path;
      pd.prodcost = cost;
      pd.proddesc = desc;
      Navigator.pushNamed(context, '/product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 200;
      final imageSize = isMobile ? 140.0 : 300.0;
      return Column(children: [
        Image.asset(
          path,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.cover,
        ),
        TextButton(
          onPressed: () => navtoprod(context),
          child: Text(name, textAlign: TextAlign.left),
        ),
        Text(cost),
      ]);
    });
  }
}
