import 'coin_data.dart';
import 'price_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingRoute extends StatefulWidget {
  @override
  _LoadingRouteState createState() => _LoadingRouteState();
}

class _LoadingRouteState extends State<LoadingRoute> {
  final CoinData coinData = CoinData();
  bool _loadingState = true;
  String _loadingDescription = '';

  @override
  void initState() {
    super.initState();
    this.getBitcoinData();
  }

  void getBitcoinData() async {
    setState(() {
      _loadingDescription = 'Getting quotation data...';
    });
    var didFetch = await coinData.getCurrentRates();

    didFetch == true
      ? Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PriceRoute(coinData: coinData,)
          )
        )
      : setState(() {
          _loadingDescription = 'Could not get data.';
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
                  color: Colors.black,
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
                  onPressed: () => getBitcoinData(),
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
