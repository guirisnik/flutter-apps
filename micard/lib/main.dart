import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
              ),
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
              Text(
                "Gui Risnik",
                style: TextStyle(
                  fontFamily: "Indie Flower",
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                  fontFamily: "Source Sans Pro",
                  fontSize: 20.0,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     vertical: 10.0,
              //   ),
              //   color: Colors.amber.shade600,
              //   width: 120.0,
              //   height: 2.0,
              // ),
              SizedBox(
                height: 20.0,
                width: 120.0,
                child: Divider(
                  color: Colors.amber.shade600,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 45.0,
                ),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.blueGrey.shade900,
                  ),

                  title: Text(
                    "+55 (11) 98404-0434",
                    style: TextStyle(
                      fontFamily: "Source Sans Pro",
                      fontSize: 18.0,
                      color: Colors.blueGrey.shade900
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 45.0,
                ),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blueGrey.shade900,
                  ),
                  title: Text(
                    "guilherme.risnik@gmail.com",
                    style: TextStyle(
                      fontFamily: "Source Sans Pro",
                      fontSize: 18.0,
                      color: Colors.blueGrey.shade900
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
 * In order for hot realod to work, the app builder MyApp
 * needs to be inside a class that extends a StatelessWidget or
 * StatefulWidget
 * 
 * Flutter has a shortcut for it called:
 *    > Flutter stateless widget
 */
class RowAndColumnChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 100.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.yellow,
                      height: 100.0,
                      width: 100.0,
                    ),
                    Container(
                      color: Colors.green,
                      height: 100.0,
                      width: 100.0,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.blue,
                width: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
