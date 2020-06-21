import 'package:flutter/material.dart';
import 'package:clima/utils/constants.dart';

class CityRoute extends StatefulWidget {
  @override
  _CityRouteState createState() => _CityRouteState();
}

class _CityRouteState extends State<CityRoute> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                onPressed: () => {Navigator.pop(context)},
                child: Icon(Icons.chevron_left, size: 50.0),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            RaisedButton(
              child: Text('Search'),
              onPressed: () => Navigator.pop(context, cityName),
            )
          ],
        ),
      ),
    );
  }
}
