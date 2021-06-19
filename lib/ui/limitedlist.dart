import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cakdam/style/style.dart';
import 'package:cakdam/ui/fullylisted.dart';

class Limitedlist extends StatefulWidget {
  Limitedlist({Key key}) : super(key: key);

  @override
  _LimitedlistState createState() => _LimitedlistState();
}

class _LimitedlistState extends State<Limitedlist> {
  DatabaseReference _db = FirebaseDatabase.instance.reference().child("CakDam");
  var dataList = List();
  var damList = List();

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
          Padding(
            padding: const EdgeInsets.only(right:30,top:25),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Fullylisted()),);
              },
              child: Text("Lihat selengkapnya",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Coloring.iconicColor,
                      fontSize: 12,
                      fontFamily: Fonts.REGULAR,
                  ) ),
            ),
          ),
        Stack(
          children: [
            FutureBuilder(
                future: _db.once(),
                builder: (context, snapshot){
                  if(snapshot.hasData){

                    dataList.clear();

                    Map<dynamic, dynamic> values = snapshot.data.value;
                    values.forEach((key, value) {
                      dataList.add(value);
                      damList.add(key);
                    });

                    return SizedBox(
                      height: 300,
                      child: new ListView.builder(
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index){

                            return Stack(
                              children: [
                                Center(
                                  child: Container(
                                    child: Container(
                                      margin: EdgeInsets.only(right:190),//u yo g paham asline coba ketik 170
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          "assets/img/rolak02.jpg",
                                          height: 10 ,
                                          width: 10,
                                          fit: BoxFit.fitWidth, //iku pas kate ng maps ono ngebug e disik zzz
                                        ),
                                      ),
                                    ),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                   Padding(
                                      padding: const EdgeInsets.only(right:110,top:50),
                                      child: Text(damList[index], // iki nama ndek home
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: Fonts.BOLD
                                          ) ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:200,right:30,top:10),
                                      child: Text("Kedungkandang, Kota Malang",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontFamily: Fonts.REGULAR
                                          ) ),
                                ),
                                    SizedBox(height:15),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left:200,top:5),
                                          child: Text(
                                              "${dataList[index]["Ultrasonic"]["Data"]}",
//                                              dataList[index]["Ultrasonic"]["Data"] < 300 ? "Normal" : "Siaga",
//                                              dataList[index]["Data"] < 200 ? "Normal" : "Siaga",
//                                            print('Data : ${snapshot.value}');
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontFamily: Fonts.BOLD
                                              ) ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30,right:20),
                                          child: IconButton(
                                            icon: Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Detail(nama:"test")));
                                            },
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            );

                          }),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })

//
          ],
        ),
        ],
      );
  }
}

