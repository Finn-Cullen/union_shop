import 'package:flutter/material.dart';
import 'package:union_shop/products.dart';

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
    return (Column(children: [
      Image.asset(
        path,
        width: 500,
        height: 500,
      ),
      TextButton(
        onPressed: () => navtoprod(context),
        child: Text(name, textAlign: TextAlign.left),
      ),
      Text(cost),
    ]));
  }
}
