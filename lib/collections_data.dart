import 'package:flutter/material.dart';


enum Collections{
  af(collname: 'Autumn favourites', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  bf(collname: 'black friday', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498'),
  ub(collname: 'UPSU bears', displayurl: 'https://shop.upsu.net/cdn/shop/files/SageHoodie_720x.png?v=1745583498');

  const Collections({
    required this.collname,
    required this.displayurl,
  });

  final String collname;
  final String displayurl;
}

CollectionsData csd = CollectionsData();

class CollectionsData {
  String collselected = 'UPSU bears';
  String colltitletext = '';

  Widget orderrowanscolumns(List<Widget> list){
    List<Widget> prod = [];
    for (int i = 0; i < list.length;){ // this function turns a list of items into a set of rows in a column
      Widget hold = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          list[i],
          list[i+1],
          list[i+2],
        ],
      );
      i += 3;
      prod.add(hold);
    }

    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: prod,);
  }

  Widget buildcoll(BuildContext context){
    final listofcollections = Collections.values.map((T) {
      return DisplayCollection(
        T.collname,
        T.displayurl,
      );
    }).toList();
    return orderrowanscolumns(listofcollections);
  }

}

class DisplayCollection extends StatelessWidget{
  final String name;
  final String url;

  const DisplayCollection(this.name, this.url,{super.key});

  void nav(BuildContext context, String coll){
    csd.collselected = coll;
    Navigator.pushNamed(context, '/collection');
  }

  @override
  Widget build(BuildContext context){
    return(
      Container(
        width : 300,
        height : 300,
        decoration: BoxDecoration(
          image: DecorationImage(fit:BoxFit.fill ,image: NetworkImage(url))
        ),
        child: Center(child: TextButton(onPressed: () => nav(context,name), child: Text(name,style: const TextStyle(color: Colors.white,fontSize: 20)))),
        
      )
    );
  }
}