import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';

class LocationRoute extends StatefulWidget {
  final Weather weather;

  const LocationRoute({this.weather});

  @override
  _LocationRouteState createState() => _LocationRouteState();
}

class _LocationRouteState extends State<LocationRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'This is the weather route!!!',
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 3.0,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.amber,
                    size: 50.0,
                  ),
                  Icon(
                    Icons.wb_cloudy,
                    color: Colors.blue,
                    size: 50.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
