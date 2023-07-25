import 'dart:convert';
import 'package:qu_tt9/services/quote_model.dart';

import 'package:http/http.dart' as http;

import 'image_model.dart';

class ApiRequest2 {
  Future<List<Welcome02>> getData02() async {
    http.Response response = await http.get(
        Uri.parse('https://api.quotable.io/quotes/random'));
    if (response.statusCode == 200) {
      print(response.body);
      return welcome02FromJson(response.body);
    }
    return Future.error("somthing wrong");
  }
}