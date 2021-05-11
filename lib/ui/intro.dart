import 'package:flutter/material.dart';
import 'package:cakdam/style/style.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                color: Coloring.secondColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          Center(
          child:  Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left:70,right:70,top:50),
                  child: Text("Cak Dam adalah aplikasi pemantau "
                      "dan pembuka kanal dam berbasis IoT ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: Fonts.REGULAR
                      ) ),
                ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Solusi cerdas memantau dam",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: Fonts.BOLD,
                        fontStyle: FontStyle.italic
                    ) ),
              ),
            ],
          ),
          )
        ],
      )
    );
  }
}
