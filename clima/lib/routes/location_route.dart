import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'city_route.dart';

class LocationRoute extends StatefulWidget {
  final Weather weather;

  const LocationRoute({this.weather});

  @override
  _LocationRouteState createState() => _LocationRouteState();
}

class _LocationRouteState extends State<LocationRoute> {
  String city;
  int temperature;

  @override
  void initState() {
    super.initState();
    this.city = widget.weather.city;
    this.temperature = widget.weather.temperature;
  }

  void onSync() async {
    await widget.weather.getWeatherData();
    setState(() {
      this.city = widget.weather.city;
      this.temperature = widget.weather.temperature;
    });
  }

  void getCityWeather(cityName) async {
    await widget.weather.getCityWeatherData(cityName: cityName);
    setState(() {
      this.city = widget.weather.city;
      this.temperature = widget.weather.temperature;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () => this.onSync(),
                  child: Icon(
                    Icons.sync,
                    size: 50,
                  ),
                  padding: EdgeInsets.all(10),
                ),
                FlatButton(
                  onPressed: () async {
                    var cityName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityRoute()
                      )
                    );

                    if (cityName != null) {
                      getCityWeather(cityName);
                    }
                  },
                  child: Icon(
                    Icons.location_city,
                    size: 50,
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
            Column(
              children: [
                widget.weather.getConditionIcon(),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'The current temperature in $city is $temperature°C',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 3.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
