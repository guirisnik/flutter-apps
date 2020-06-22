import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoinData {
  static const Duration DEFAULT_TIMEOUT = Duration(seconds: 5);
  static const API_GATEWAY = 'https://rest.coinapi.io';
  static const API_KEY = '8A388D49-D6FD-4860-A20A-38ABE0C85EC1';
  
  static const COINS = ['BTC', 'ETH', 'LTC'];
  static const List<String> CURRENCIES = [
    'USD',
    'AUD',
    'BRL',
    'CAD',
    'CHF',
    'CLP',
    'CNY',
    'DKK',
    'EUR',
    'GBP',
    'HKD',
    'INR',
    'ISK',
    'JPY',
    'KRW',
    'NZD',
    'PLN',
    'RUB',
    'SEK',
    'SGD',
    'THB',
    'TRY',
    'TWD',
  ];

  Map<String, Map> _coinData = {
    'BTC': {},
    'ETH': {},
    'LTC': {},
  };

  Future _getRatesForCoin({ @required String coinName }) async {
    try {
      var response = await http
        .get(
          '$API_GATEWAY/v1/exchangerate/$coinName?invert=false', 
          headers: {
            'X-CoinAPI-Key': API_KEY,
          }
        )
        .timeout(DEFAULT_TIMEOUT);

      if (response.statusCode == 200) return await jsonDecode(response.body);
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<bool> getCurrentRates() async {
    try {
      for (String coinName in COINS) {
        var rates = await _getRatesForCoin(coinName: coinName);
        if (rates != null)  _setCoinData(rates, coinName: coinName);
      }

      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  void _setCoinData(var rates, { String coinName }) {
    rates['rates'].forEach((rate) {
      _coinData[coinName][rate['asset_id_quote']] = rate['rate'];
    });
  }

  double getQuotation({ 
    @required String coin, 
    @required String currency 
  }) => _coinData[coin][currency];
}