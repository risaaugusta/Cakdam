import 'package:cakdam/ui/home.dart';
import 'package:cakdam/ui/limitedlist.dart';
import 'package:cakdam/ui/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Splashscreen(),
//    home: Limitedlist(),
    );
  }
}
