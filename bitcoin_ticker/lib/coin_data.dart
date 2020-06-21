import 'dart:convert';
import 'package:http/http.dart' as http;

class BitcoinData {
  static const Duration DEFAULT_TIMEOUT = Duration(seconds: 5);
  static const API_GATEWAY = 'https://blockchain.info/ticker';

  var _bitcoinData;
  List<String> _currencies = [];

  Future<bool> getBitcoinData() async {
    try {
      var response = await http.get(API_GATEWAY).timeout(DEFAULT_TIMEOUT);

      if (response.statusCode == 200) {
        _bitcoinData = jsonDecode(response.body);
        _currencies = _bitcoinData.keys.toList();
        return true;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  List<String> get currencies => _currencies;
  double getQuotation({ String currency }) => _bitcoinData[currency]['last'];
}