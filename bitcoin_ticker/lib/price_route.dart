import 'coin_data.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceRoute extends StatefulWidget {
  final CoinData coinData;

  const PriceRoute({this.coinData});

  @override
  _PriceRouteState createState() => _PriceRouteState();
}

class _PriceRouteState extends State<PriceRoute> {
  String selectedCurrency;
  Map<String, String> currentRate = {};

  CupertinoPicker iosPicker() => CupertinoPicker(
    itemExtent: 32.0, 
    onSelectedItemChanged: (value) => 
      setCurrencyRate(currency: CoinData.CURRENCIES[value]), 
    children: CoinData.CURRENCIES.map<Text>((String currency) => Text(
        currency, 
        style: TextStyle(
          color: Colors.white
        ),
      )
    ).toList()
  );

  DropdownButton androidPicker() => DropdownButton(
    value: selectedCurrency,
    style: TextStyle(color: Colors.black),
    items: CoinData.CURRENCIES.map<DropdownMenuItem<String>>(
      (String currency) => DropdownMenuItem(
        child: Text(currency),
        value: currency,
      )
    ).toList(), 
    onChanged: (value) => setCurrencyRate(currency: value),
  );

  Widget getPicker() {
    if (Platform.isIOS) return iosPicker();
    return androidPicker();
  }

  Card getCoinCard({ String coinName }) => Card(
    color: Colors.lightBlueAccent,
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        '1 $coinName = ${currentRate[coinName]} $selectedCurrency',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    setCurrencyRate(currency: CoinData.CURRENCIES[0]);
  }

  void setCurrencyRate({ @required String currency }) {
    setState(() {
      selectedCurrency = currency;
      CoinData.COINS.forEach((coinName) {
        currentRate[coinName] = widget.coinData.getQuotation(
          coin: coinName, 
          currency: selectedCurrency
        ).toStringAsFixed(2);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: CoinData.COINS.map<Padding>((coinName) => Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: getCoinCard(coinName: coinName),
            )).toList(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.only(bottom: 30.0),
            child: getPicker(),
          ),
        ],        
      ),
    );
  }
}
