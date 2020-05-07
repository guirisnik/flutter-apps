import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({ this.url });

  static const Duration DEFAULT_TIMEOUT = Duration(seconds: 5);
  final String url;

  Future getData() async {
    try {
      var response = await http.get(url).timeout(DEFAULT_TIMEOUT);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      return null;
    }
  }
}