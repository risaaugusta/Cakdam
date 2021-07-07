import 'package:cakdam/ui/auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cakdam/style/style.dart';
import 'package:url_launcher/url_launcher.dart';

class Fullylisted extends StatefulWidget {
  Fullylisted({Key key}) : super(key: key);

  @override
  _FullylistedState createState() => _FullylistedState();
}

class _FullylistedState extends State<Fullylisted> {
  final databaseReference = FirebaseDatabase.instance.reference().child("CakDam");
  var dataList = List();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text(
          (" Daftar Dam"),
          style: TextStyle(
              color: Coloring.mainColor,
              fontSize: 12,
              fontFamily: Fonts.BOLD
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Coloring.secondColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/img/bg.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: Limitedlist(),
      ),
    );
  }
}

class DamList extends StatefulWidget {
  DamList({Key key}) : super(key: key);

  @override
  _DamListState createState() => _DamListState();
}

class _DamListState extends State<DamList> {
  final List<String> namaDam = <String>['Dam Kadalpang', 'Dam Rolak', 'Dam Sengkaling','Dam Kalisari'];
  final List<String> alamat = <String>[
    'Kec. Klojen, Kota Malang',
    'Kedungkandang, Kota Malang',
    'Terusan Sengkaling, Kota Malang',
    'Mangliawan, Pakis, Malang'];
  final List<String> img = <String>[
    'assets/img/kadalpang.jpg',
    'assets/img/rolak.jpg',
    'assets/img/rolak.jpg',
    'assets/img/rolak.jpg'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: img.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => _launchMap(namaDam[index]),
            child: Container(
              margin: EdgeInsets.only(top:25),
              height: 150,
              width: 350,
              decoration: BoxDecoration( //ini kan ke detail
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
////
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
//                    margin: EdgeInsets.only(right:10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        '${img[index]}',
                        height: 150,
                        width: 150,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:15),
                        child: Text('${namaDam[index]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: Fonts.BOLD
                            ) ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left:10,top: 5),
                        child: Text('${alamat[index]}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: Fonts.REGULAR
                            ) ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:180,top:30),
                        child: IconButton(
                          icon: Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                          onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Detail(nama:namaDam[index],alamat:alamat[index],img:img[index])),); //lebokno variabel
                          },
                        ),
                      )
                    ],
            ),
                ],
              ),
            ),
          );
        }
    );
  }
}

//MAPS
_launchMap(String namaDam) async {
  final String gmapsRolak = "https://goo.gl/maps/QKPgf6ZQKkbQYY4n6";
  final String gmapsKadalpang = "https://goo.gl/maps/DeQBTjae7sXJSDJi9";
  final String gmapsSengakling = "https://goo.gl/maps/GFKeVmWycgwax7HT6";
  final String gmapsKalisari = "https://goo.gl/maps/iN8x8iS6JLE9SHbu8";

  if ( namaDam == "Dam Rolak" && await canLaunch(gmapsRolak)) {
    await launch(gmapsRolak);
  }
  else if (namaDam == "Dam Kadalpang" && await canLaunch(gmapsKadalpang)) {
    await launch(gmapsKadalpang);
  }
  else if (namaDam == "Dam Kalisari" && await canLaunch(gmapsKadalpang)) {
    await launch(gmapsKadalpang);
  }
  else if (namaDam == "Dam Sengkaling" && await canLaunch(gmapsKadalpang)) {
    await launch(gmapsKadalpang);
  } else {
    throw "Couldn't launch URL";
  }
}

//list
class Limitedlist extends StatefulWidget {
  Limitedlist({Key key}) : super(key: key);

  @override
  _LimitedlistState createState() => _LimitedlistState();
}

class _LimitedlistState extends State<Limitedlist> {
  DatabaseReference _db = FirebaseDatabase.instance.reference().child("CakDam");
  var dataList = List();
  var damList = List();

  final List<String> namaDam = <String>['Dam Kadalpang', 'Dam Kalisari', 'Dam Rolak','Dam Sengkaling'];
  final List<String> alamat = <String>[
    'Kec. Klojen, Kota Malang',
    'Mangliawan, Pakis, Malang',
    'Kedungkandang, Kota Malang',
    'Terusan Sengkaling, Kota Malang',
    ];
  final List<String> img = <String>[
    'assets/img/kadalpang.jpg',
    'assets/img/rolak.jpg',
    'assets/img/rolak.jpg',
    'assets/img/rolak.jpg'];

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

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
                      damList.add(key); //ambil valUE dan keynya
                    });

                    return SizedBox(
//                      height: MediaQuery.of(context).size.height,
                    height: 500,
                      child: new ListView.builder(
                          itemCount: snapshot.data.value.length, //wes? gini aja?
                          itemBuilder: (BuildContext context, int index){
                          print(damList.length);
                            return  GestureDetector(
                              onTap: () => _launchMap(namaDam[index]),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      child: Container(
                                        margin: EdgeInsets.only(right:190),//u yo g paham asline coba ketik 170
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            '${img[index]}',
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
                                        child: Text('${alamat[index]}',
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
                                            padding: const EdgeInsets.only(left: 70,right:20),
                                            child: IconButton(
                                              icon: Icon(Icons.chevron_right, size: 20, color: Colors.grey),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                  MaterialPageRoute(builder: (context) => Detail(nama:namaDam[index],alamat:alamat[index],img:img[index], dataList:dataList[index])),); //lebokno variabel
//                                                  MaterialPageRoute(builder: (context) => Detail(nama:"test")));
                                              },
                                            ),
                                          )
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
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







//DETAIL
//class Detail extends StatelessWidget {
//  DatabaseReference _db = FirebaseDatabase.instance.reference().child("CakDam");
//  var dataList = List();
//  var damList = List();
//  String nama = '';
//  String alamat = '';
//  String img = '';
//
//  Detail({this.nama,this.alamat,this.img});
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: new Text(
//          ("Detail Dam"),
//          style: TextStyle(
//              color: Coloring.mainColor,
//              fontSize: 12,
//              fontFamily: Fonts.BOLD
//          ),
//          textAlign: TextAlign.center,
//        ),
//        backgroundColor: Coloring.secondColor,
//      ),
//      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          Stack(
//            children: [
//              ClipPath(
//                clipper: MyClipper(),
//                child: Container(
//                  height: 250,
//                  decoration: BoxDecoration(
//                    image: const DecorationImage(
//                      image: AssetImage('assets/img/kadalpang.jpg'),
//                      fit: BoxFit.cover,
//                    ),
//                  ),
//
//                ),
//              ),
//
//            ],
//          ),
//          Flexible(
//            child: Container(
//              height: 750,
//              width: 385,
////            margin: EdgeInsets.only(left: 20),
//              child: ListView(
//                scrollDirection: Axis.vertical,
//                children: [
//                  Padding(
//                      padding: EdgeInsets.only(left: 20, top: 10),
//                      child: Text(nama, style: //itu yg ini
//                      TextStyle(color: Colors.black,
//                          fontSize: 20,
//                          fontFamily: Fonts.BOLD))),
//
//                  Container(
//                      width: 50,
//                      margin: EdgeInsets.only(left: 20, top: 10),
//                      child: Text(
//                        "Status      : ",
//
//                        style:
//                        TextStyle(color: Colors.black,
//                            fontSize: 15,
//                            fontFamily: Fonts.REGULAR),
//                        textAlign: TextAlign.justify,)),
//
//                  Container(
//                      width: 350,
//                      margin: EdgeInsets.only(left: 20 ),
//                      child: Text("Arus air    : ",
//                          textAlign: TextAlign.justify,
//                          style:
//                          TextStyle(color: Colors.black,
//                            fontSize: 15,
//                            fontFamily: Fonts.REGULAR,))
//
//                  ),
//                  Container(
//                      width: 350,
//                      margin: EdgeInsets.only(left: 20 ),
//                      child: Text("Debit air   : ",
//                          textAlign: TextAlign.justify,
//                          style:
//                          TextStyle(color: Colors.black,
//                            fontSize: 15,
//                            fontFamily: Fonts.REGULAR,))
//
//                  ),
//
//
//                ],
//              ),
//            ),
//          ),
//
//          Row(
//            children: [
//              Padding(
//                padding: EdgeInsets.only( left:70,bottom: 50),
//                child: ButtonTheme(
//                  minWidth: 120,
//                  height: 50,
//                  child: RaisedButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10.0),
//                        side: BorderSide(color: Coloring.iconicColor)),
//                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Auth()),);
//                    },
//                    color: Colors.white,
//                    textColor: Coloring.iconicColor,
//                    child: Text("Tutup Kanal", style:
//                    TextStyle(color: Coloring.iconicColor,
//                        fontSize: 15,
//                        fontFamily: Fonts.REGULAR)),
//                  ),
//                ),
//              ),
//              SizedBox(width: 30),
//              Padding(
//                padding: EdgeInsets.only( bottom: 50),
//                child: ButtonTheme(
//                  minWidth: 120,
//                  height: 50,
//                  child: RaisedButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10.0),
//                        side: BorderSide(color: Coloring.iconicColor)),
//                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Auth()),);
//                    },
//                    color: Coloring.iconicColor,
//                    textColor: Colors.white,
//                    child: Text("Buka Kanal", style:
//                    TextStyle(color: Colors.white,
//                        fontSize: 15,
//                        fontFamily: Fonts.REGULAR)),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ],
//      ),
//
//    );
//  }
//}


//DETAIL YANG NYOBA
class Detail extends StatefulWidget {
  Detail({Key key, this.nama,this.alamat,this.img, this.dataList}) : super(key: key);
  String nama = '';
  String alamat = '';
  String img = '';
  var dataList = {};

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  DatabaseReference _db = FirebaseDatabase.instance.reference().child("CakDam");
  var dataList = List();
  var damList = List();

  final List<String> namaDam = <String>['Dam Kadalpang', 'Dam Kalisari', 'Dam Rolak','Dam Sengkaling'];
  final List<String> alamat = <String>[
    'Kec. Klojen, Kota Malang',
    'Mangliawan, Pakis, Malang',
    'Kedungkandang, Kota Malang',
    'Terusan Sengkaling, Kota Malang',
  ];
  final List<String> img = <String>[
    'assets/img/kadalpang.jpg',
    'assets/img/rolak.jpg',
    'assets/img/rolak.jpg',
    'assets/img/rolak.jpg'];

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        Stack(
          children: [
            SizedBox(
//                      height: MediaQuery.of(context).size.height,
                      height: 500,
                      child:
                            Scaffold(
                              appBar: AppBar(
                                centerTitle: true,
                                title: new Text(
                                  ("Detail Dam"),
                                  style: TextStyle(
                                      color: Coloring.mainColor,
                                      fontSize: 12,
                                      fontFamily: Fonts.BOLD
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Coloring.secondColor,
                              ),
                              body: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipPath(
                                        clipper: MyClipper(),
                                        child: Container(
                                          height: 250,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image: AssetImage('assets/img/kadalpang.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),

                                        ),
                                      ),

                                    ],
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 750,
                                      width: 385,
                        //            margin: EdgeInsets.only(left: 20),
                                      child: ListView(
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(left: 20, top: 10),
                                              child: Text(widget.nama, style: //itu yg ini
                                              TextStyle(color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: Fonts.BOLD))),

                                          Container(
                                              width: 50,
                                              margin: EdgeInsets.only(left: 20, top: 10),
                                              child: Text(
//                                                "Status      : " + widget.dataList["Ultrasonic"]["Data"].toString(),

                                                "Status : ${dataList.map((e) => e.toString()).toList()}",
                                                style:
                                                TextStyle(color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: Fonts.REGULAR),
                                                textAlign: TextAlign.justify,)),

                                          Container(
                                              width: 350,
                                              margin: EdgeInsets.only(left: 20 ),
                                              child: Text("Arus air    : ",
                                                  textAlign: TextAlign.justify,
                                                  style:
                                                  TextStyle(color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: Fonts.REGULAR,))

                                          ),
                                          Container(
                                              width: 350,
                                              margin: EdgeInsets.only(left: 20 ),
                                              child: Text("Debit air   : ",
                                                  textAlign: TextAlign.justify,
                                                  style:
                                                  TextStyle(color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily: Fonts.REGULAR,))

                                          ),


                                        ],
                                      ),
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only( left:70,bottom: 50),
                                        child: ButtonTheme(
                                          minWidth: 120,
                                          height: 50,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Coloring.iconicColor)),
                                            onPressed: () {
//                                              Navigator.push(
//                                                context,
//                                                MaterialPageRoute(builder: (context) => Auth()),);
                                              print(dataList);
                                            },
                                            color: Colors.white,
                                            textColor: Coloring.iconicColor,
                                            child: Text("Tutup Kanal", style:
                                            TextStyle(color: Coloring.iconicColor,
                                                fontSize: 15,
                                                fontFamily: Fonts.REGULAR)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      Padding(
                                        padding: EdgeInsets.only( bottom: 50),
                                        child: ButtonTheme(
                                          minWidth: 120,
                                          height: 50,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                                side: BorderSide(color: Coloring.iconicColor)),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Auth()),);
                                            },
                                            color: Coloring.iconicColor,
                                            textColor: Colors.white,
                                            child: Text("Buka Kanal", style:
                                            TextStyle(color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: Fonts.REGULAR)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                            ),
            ),

//
          ],
        ),
      ],
    );
  }
}




//CLIPPER
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height-90);
    var controllPoint=Offset(50, size.height);
    var endPoint=Offset(size.width/2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height );
    path.lineTo(size.width,0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}