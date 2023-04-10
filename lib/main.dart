import 'package:flutter/material.dart';
import 'views/home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
