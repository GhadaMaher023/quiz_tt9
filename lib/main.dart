
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qu_tt9/services/image_model.dart';
import 'package:qu_tt9/services/capture_img.dart';
import 'package:qu_tt9/services/quotes_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen(),
    );
  }
}
class Screen extends StatefulWidget {


  Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String imageUrl = '';
  String quoteContent = 'Hello';
  @override
  void initState() {
    ApiRequest2().getData02().then((data02){
      quoteContent = data02[0].content;

    ImageCapture0().getData(data02[0].tags[0]).then((data) {

      setState(() {
        imageUrl = data.url;
      });
    });
  });


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: IconButton(
            onPressed: (){
            },
            icon: Icon(Icons.refresh, size: 30,color: Colors.black,),
          ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    '$imageUrl'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: const BoxConstraints.expand(),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(child: Text('$quoteContent',style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),)),
          ),
        ],
      ),
    );
  }
}

