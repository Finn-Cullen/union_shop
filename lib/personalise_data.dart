import 'package:flutter/material.dart';



enum PersTypes{

  oneline(
    perstype: 'one line',
    persprice: '£3.00',
    lineoftext: 1,
  ),
  twoline(
    perstype: 'two lines',
    persprice: '£4.00',
    lineoftext: 2,
  ),
  threeline(
    perstype: 'three lines',
    persprice: '£5.00',
    lineoftext: 3,
  ),
  ;

  const PersTypes({
    required this.perstype,
    required this.persprice,
    required this.lineoftext,
  });

  final String perstype;
  final String persprice;
  final int lineoftext;
}

class PrintData {
  String persprice = PersTypes.oneline.persprice;
  String persdesc = PersTypes.oneline.perstype;
  List<Widget> perslineinp = [];

  void perslineinpset(){
    List listtype = [];
    List listnum = [];
    int save = 0;
    PersTypes.values.map((T) {
      listtype.add(T.persprice);
      listnum.add(T.lineoftext);
    }).toList();
    for(int i = 0; i < listtype.length; i++){
      if(listtype[i] == persprice){save = i;}
    }
    List<Widget> inpfields = [];
    for(int i = 0; i < listnum[save]; i++){
      inpfields.add(
        Text('line ' + (i+1).toString()),
      );
      inpfields.add(
        TextField()
      );
    }

    perslineinp = inpfields;
  }
}