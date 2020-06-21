import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceRoute extends StatefulWidget {
  final BitcoinData bitcoinData;

  const PriceRoute({this.bitcoinData});

  @override
  _PriceRouteState createState() => _PriceRouteState();
}

class _PriceRouteState extends State<PriceRoute> {
  List<Text> buildCurrencyList() {
    return widget.bitcoinData.currencies.map<Text>((String currency) {
      return Text(
        currency, 
        style: TextStyle(
          color: Colors.white, 
          fontSize: 18),
        );
    }).toList();
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
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      '1 BTC = ? USD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      '1 BTC = ? BRL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: CupertinoPicker(
              squeeze: 1.2,
              itemExtent: 20.0, 
              onSelectedItemChanged: (value) {
                print(value);
              }, 
              children: buildCurrencyList(),
            ),
            color: Colors.lightBlueAccent,
            height: 130.0,
          ),
        ],
      ),
    );
  }
}
