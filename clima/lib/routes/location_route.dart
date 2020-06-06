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
                    this.widget.weather.getConditionIconData(),
                    color: Colors.amber,
                    size: 50.0,
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'The current temperature in ${this.widget.weather.city} is ${this.widget.weather.temperature}°C',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 3.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
