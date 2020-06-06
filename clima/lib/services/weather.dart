import 'networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Weather {
  static const API_KEY = 'd4e9de980362fe77844bfc3221220efb';
  static const FETCH_URL = 'http://api.openweathermap.org/data/2.5/weather?units=metric&';

  var weatherData;

  Future fetchWeatherData({double latitude, double longitude}) async {
    try {
      weatherData = await NetworkHelper(
        url: '${FETCH_URL}lat=$latitude&lon=$longitude&appid=$API_KEY').getData();
    } catch (e) {
      print(e);
    }

    print(weatherData);
    return weatherData;
  }

  IconData getConditionIconData() {
    if(this._conditionId < 300) return Ionicons.ios_thunderstorm;
    if(this._conditionId < 500) return Feather.cloud_drizzle;
    if(this._conditionId < 600) return FlutterIcons.cloud_rain_fea;
    if(this._conditionId < 700) return FlutterIcons.ios_snow_ion;
    if(this._conditionId < 800) return FlutterIcons.weather_fog_mco;
    if(this._conditionId == 800) return Feather.sun;
    return FlutterIcons.cloud_faw5s;
  }

  int get temperature => weatherData['main']['temp'].toInt();
  String get city => weatherData['name'];
  int get _conditionId => weatherData['weather'][0]['id'];
}
