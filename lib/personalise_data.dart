import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class PrintData {
  String persprice = '£3.00';
  String persdesc = 'description';
  late List<Widget> perslineinp = [TextField()];

  void perslineinpset() async {
    int save = 0;

    final map = await buildlist();
    final listtype = map.map((v) => v["persprice"]).toList();
    final listnum = map.map((v) => v["lineoftext"]).toList();

    for (int i = 0; i < listtype.length; i++) {
      if (listtype[i] == persprice) {
        save = i;
      }
    }
    List<Widget> inpfields = [];
    for (int i = 0; i < listnum[save]; i++) {
      inpfields.add(
        Text('line ${(i + 1)}'),
      );
      inpfields.add(TextField());
    }

    perslineinp = inpfields;
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
