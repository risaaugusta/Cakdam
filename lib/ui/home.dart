import 'package:cakdam/ui/intro.dart';
import 'package:cakdam/ui/limitedlist.dart';
import 'package:flutter/material.dart';
import 'package:cakdam/style/style.dart';
import 'package:cakdam/ui/intro.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children: [
         Container(
           height: 700,
//         height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
             image: const DecorationImage(
               image: AssetImage('assets/img/bg.png'),
               fit: BoxFit.cover,
             ),
           ),
         ),
         Container(
           margin: EdgeInsets.only(top: 30, left: 25),
           height: 150,
           width: MediaQuery.of(context).size.width,
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Image.asset(
                 "assets/img/logo.png",
                 height: 50,
                 width: 50,
                 fit: BoxFit.cover,
               ),
               SizedBox(width: 10),
               Padding(
                 padding: const EdgeInsets.only(top:15),
                 child: Text("Cak Dam",
                     style: TextStyle(
                     color: Coloring.mainColor,
                     fontSize: 14,
                     fontFamily: Fonts.BOLD
                 ) ),
               ),
             ],
           ),
         ),
         ListView(
           scrollDirection: Axis.vertical,
           children: <Widget>[
             SizedBox(height:75),
             Intro(),
             Limitedlist(),
           ],
         ),
       ],
      ),
    );
  }
}