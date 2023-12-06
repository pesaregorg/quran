import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class QuranModel extends HiveObject {



  // load data from json files in asset
  Future<List<Map<String, dynamic>>> loadJsonAsset(String assetsPath) async {
  final String jsonString = await rootBundle.loadString(assetsPath);
  List<dynamic> list = await jsonDecode(jsonString);

  return list.map((item) => item as Map<String, dynamic>).toList();

  }



}