import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cakdam/ui/home.dart';
import 'package:cakdam/style/style.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  void initState(){
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>Home()),
      );
    });
    }

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    throw UnimplementedError();
//  }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 350,
                width: 350,
                child: Image(image: AssetImage('assets/img/logo.png'))
            ),
            Text("Cak Dam",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff1D407B),
                    fontSize: 25,
                    fontFamily: Fonts.BOLD,
                    fontWeight: FontWeight.bold,
                )
            )
          ],
        ),
      ),
    );
  }
}