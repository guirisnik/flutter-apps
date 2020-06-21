import 'location_route.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingRoute extends StatefulWidget {
  @override
  _LoadingRouteState createState() => _LoadingRouteState();
}

class _LoadingRouteState extends State<LoadingRoute> {
  final Location location = Location();
  final Weather weather = Weather();
  bool _loadingState = true;
  String _loadingDescription = '';

  @override
  void initState() {
    super.initState();
    this.getWeatherData();
  }

  void getWeatherData() async {
    setState(() {
      _loadingDescription = 'Getting weather data...';
    });
    var didFetch = await weather.getWeatherData();

    didFetch != null
      ? Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationRoute(weather: weather,)
          )
        )
      : setState(() {
          _loadingDescription = 'Could not get weather.';
          _loadingState = false;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _loadingState
                ? SpinKitRipple(
                  color: Colors.white,
                  size: 100.0,
                )
                : Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.white,
                  size: 100.0,
                ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                this._loadingDescription,
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 3.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _loadingState
                ? SizedBox()
                : RaisedButton(
                  onPressed: () => getWeatherData(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.sync,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'RETRY',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
