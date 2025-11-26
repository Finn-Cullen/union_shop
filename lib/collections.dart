import 'package:flutter/material.dart';
import 'package:union_shop/navigation.dart';
import 'package:union_shop/collections_data.dart';


class CollectionsPage extends StatelessWidget{
  const CollectionsPage({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

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

  @override
  Widget build(BuildContext context){

    final collections = buildcoll(context);

    return
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Navbar(),
              const SizedBox( // text at top
                height: 140,
                child: Text('COLLECTIONS',style: TextStyle(fontSize: 60)),
              ),
              SizedBox( // products
                child: collections
              ),
              const Footer(),
            ],
          ),
        ),
      );
  }
}

class DisplayCollection extends StatelessWidget{
  final String name;
  final String url;

  const DisplayCollection(this.name, this.url,{super.key});

  void nav(BuildContext context, String coll){
    collselected = coll;
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