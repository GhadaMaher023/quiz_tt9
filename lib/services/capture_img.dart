import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qu_tt9/services/image_model.dart';
class ImageCapture0{

  Future<Welcome> getData(String tag) async {
    http.Response response = await http.get(Uri.parse('https://random.imagecdn.app/v1/image?width=1080&height=1920&category=$tag&format=json'),);
    if (response.statusCode == 200) {
      print(response.body);
      return welcomeFromJson(response.body);
    }
    return Future.error("somthing wrong");
  }
}