// @dart=2.9
import 'dart:convert';
import 'package:bwa_kos_course/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProviders extends ChangeNotifier {

  getRecommendedSpaces() async {

    var url = Uri.https('bwa-cozy.herokuapp.com', '/recommended-spaces', {'q' : 'https'});
    var result = await http.get(url);

    // print(result.statusCode);
    // print(result.body);


    if(result.statusCode == 200) {
        List data = jsonDecode(result.body);
        List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
        return spaces;
    } else {
      return <Space>[];
    }
  }

}