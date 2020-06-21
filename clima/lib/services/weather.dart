import 'location.dart';
import 'networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Weather {
  final Location location = Location();
  static const API_KEY = 'd4e9de980362fe77844bfc3221220efb';
  static const FETCH_URL =
      'http://api.openweathermap.org/data/2.5/weather?units=metric&appid=$API_KEY&';

  var weatherData;

  Future getWeatherData() async {
    try {
      await location.getCurrentLocation();

      final double latitude = location.latitude;
      final double longitude = location.longitude;

      print(location);

      weatherData =
        await NetworkHelper(url: '${FETCH_URL}lat=$latitude&lon=$longitude')
          .getData();
    } catch (e) {
      print(e);
    }

    print(weatherData);
    return weatherData;
  }

  Future getCityWeatherData({String cityName}) async {
    try {
      weatherData =
          await NetworkHelper(url: '${FETCH_URL}q=$cityName').getData();
    } catch (e) {
      print(e);
    }

    print(weatherData);
    return weatherData;
  }

  Icon getConditionIcon() {
    if (this._conditionId < 300)
      return buildConditionIcon(
          iconData: Ionicons.ios_thunderstorm, color: Colors.blueGrey.shade700);
    if (this._conditionId < 500)
      return buildConditionIcon(
          iconData: Feather.cloud_drizzle, color: Colors.black54);
    if (this._conditionId < 600)
      return buildConditionIcon(
          iconData: FlutterIcons.cloud_rain_fea,
          color: Colors.lightBlue.shade400);
    if (this._conditionId < 700)
      return buildConditionIcon(
          iconData: FlutterIcons.ios_snow_ion,
          color: Colors.lightBlue.shade100);
    if (this._conditionId < 800)
      return buildConditionIcon(
          iconData: FlutterIcons.weather_fog_mco, color: Colors.white70);
    if (this._conditionId == 800)
      return buildConditionIcon(iconData: Feather.sun, color: Colors.amber);
    return buildConditionIcon(
        iconData: FlutterIcons.cloud_faw5s, color: Colors.blue);
  }

  Icon buildConditionIcon({IconData iconData, Color color}) {
    return Icon(
      iconData,
      color: color,
      size: 50.0,
    );
  }

  int get temperature => weatherData['main']['temp'].toInt();
  String get city => weatherData['name'];
  int get _conditionId => weatherData['weather'][0]['id'];
}
