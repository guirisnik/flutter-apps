import 'networking.dart';

class Weather {
  static const API_KEY = 'd4e9de980362fe77844bfc3221220efb';
  static const FETCH_URL = 'http://api.openweathermap.org/data/2.5/weather?';

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

  double get temperature => weatherData['main']['temp'];
  String get city => weatherData['sys']['name'];
  // int get conditionId => weatherData['weather'][0]['id'];
}
