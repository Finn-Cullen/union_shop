import 'package:flutter/material.dart';
import 'package:union_shop/products.dart';

class ProductDisplay extends StatelessWidget{
  final String name;
  final String cost;
  final String url;
  final String desc;

  const ProductDisplay(this.name, this.cost, this.url, this.desc,{super.key});

  void navtoprod(BuildContext context){
    if(cost.toLowerCase() != 'sold out'){
      pd.prodname = name;
      pd.produrl = url;
      pd.prodcost = cost;
      pd.proddesc = desc;
      Navigator.pushNamed(context, '/product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return(
      Column(
        children: [
          Image.network(url,width : 500, height : 500,),
          TextButton(
            onPressed : () => navtoprod(context),
            child: Text(name,textAlign: TextAlign.left),
          ),
          Text(cost),
        ]
      )
    );
  }
}