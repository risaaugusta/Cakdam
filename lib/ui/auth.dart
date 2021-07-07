import 'package:cakdam/style/style.dart';
import 'package:cakdam/ui/fullylisted.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String pin = "petugas2021";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
//           height: 700,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/img/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 100),
                width: 250,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan pin petugas',
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only( left:70,top: 20),
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
                            MaterialPageRoute(builder: (context) => Fullylisted()),);
                        },
                        color: Colors.white,
                        textColor: Coloring.iconicColor,
                        child: Text("Kembali", style:
                        TextStyle(color: Coloring.iconicColor,
                            fontSize: 15,
                            fontFamily: Fonts.REGULAR)),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ButtonTheme(
                      minWidth: 120,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Coloring.iconicColor)),
                        onPressed: () {
                          if(pin == true){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Auth()),);
                          }else{
                            AlertDialog(
                              title: const Text('Oops!'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Pin salah. Silakan coba lagi.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Oke'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }

                        },
                        color: Coloring.iconicColor,
                        textColor: Colors.white,
                        child: Text("Masuk", style:
                        TextStyle(color: Colors.white,
                            fontSize: 15,
                            fontFamily: Fonts.REGULAR)),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          )
        ],
      ),
    );
  }
}