import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

CollectionsData csd = CollectionsData();

class CollectionsData {
  String collselected = 'UPSU bears';
  String colltitletext = '';
  Widget collections = Text('No collections found');

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

  void buildcoll(BuildContext context) async {
    List<Widget> listofcollections = [];
    final map = await buildlist();
    final collnames = map.map((v) => v["collname"]).toList();
    final urls = map.map((v) => v["displayurl"]).toList();

    for(int i = 0; i < collnames.length; i++){
      listofcollections.add(DisplayCollection(collnames[i], urls[i]));
    }

    collections = orderrowanscolumns(listofcollections);
  }
   
  Future<List<Map<String, dynamic>>> buildlist() async {
    final jsonstring = await loadJson();
    final data = jsonDecode(jsonstring)['values'];
    return List<Map<String, dynamic>>.from(data);
  }

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/enums/Collections.json');
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