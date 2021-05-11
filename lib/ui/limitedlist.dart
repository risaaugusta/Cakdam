import 'package:flutter/material.dart';
import 'package:cakdam/style/style.dart';

class Limitedlist extends StatefulWidget {
  Limitedlist({Key key}) : super(key: key);

  @override
  _LimitedlistState createState() => _LimitedlistState();
}

class _LimitedlistState extends State<Limitedlist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
          Padding(
            padding: const EdgeInsets.only(right:30,top:25),
            child: Text("Lihat selengkapnya",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Coloring.iconicColor,
                    fontSize: 12,
                    fontFamily: Fonts.REGULAR,
                ) ),
          ),
        Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top:25),
                height: 150,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ), ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right:110,top:50),
                      child: Text("Dam Kadalpang",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: Fonts.BOLD
                          ) ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:200,right:20,top:10),
                      child: Text("Jl. Mayjen Panjaitan Dalam, Penanggungan, Kec. Klojen, Kota Malang",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontFamily: Fonts.REGULAR
                          ) ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
        ],
      );
  }
}