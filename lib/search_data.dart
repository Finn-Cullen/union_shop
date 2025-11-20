import 'package:flutter/material.dart';
import 'package:union_shop/products.dart';

List<Widget> searchlist = [];


void search(String inp){
  List<Widget> sealist = [];
  Products.values.map((T) {
    if(T.name.contains(inp)){
      sealist.add(SearchProd(name: T.name,cost: T.cost, url: T.url, desc: T.desc,));
    }
    }).toList();
    searchlist = sealist;
}

class SearchProd extends StatelessWidget{
  final String name;
  final String cost;
  final String url;
  final String desc;

  const SearchProd({required this.name,required this.cost,required this.url, required this.desc,super.key});

  void navtoprod(BuildContext context){
    prodcost = cost;
    proddesc = desc;
    prodname = name;
    produrl = url;
    Navigator.pushNamed(context, '/product');
  }

  @override
  Widget build(BuildContext context){
    return
      GestureDetector(
        onTap: () => navtoprod(context),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(url),
              Text(name),
              Text('£'+cost+'.00'),
            ],
          ),
        )
      );
  }
}