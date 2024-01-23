import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:bitcoin/Networking.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String selctedBitcoin = 'BTC';
  int currentPrice = 0;
  Map<String, int> cryptoPrices = {};


  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: [
        for (var currency in currenciesList)
          DropdownMenuItem(
            child: Text(currency),
            value: currency,
          ),
      ],
      onChanged: (value) {
        setState(() {
          selectedCurrency = value ?? 'USD';
          updateUI();
        });
      },
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
          Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            // The Bottom margin is provided to align the popup above the system navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom,
            ),
            // Provide a background color for the popup.
            color: Colors.blue,
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: child,
            ),
          ),
    );
  }

  void updateUI() async {
    try {
      for (String crpto in cryptoList) {
        Networking network = Networking(
            selctedBitcoin: selctedBitcoin, selectedCurrency: crpto);
        dynamic coinData = await network.getData();
        if (coinData != null) {
          currentPrice = coinData['rate'].toInt();

          setState(() {
            cryptoPrices[crpto] = currentPrice;
          });
        }b
      }
    }
    catch(e){
      print(e);


    }
  }

  CupertinoPicker iosPicker() {
    return CupertinoPicker(
      itemExtent: 30.0,
      scrollController: FixedExtentScrollController(
          initialItem: currenciesList.indexOf(selectedCurrency)),
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          updateUI();
        });
      },
      children: [for (var currency in currenciesList) Text(currency)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🤑 Coin Ticker',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoinCard(
                crypto: 'BTC',
                currency: selectedCurrency,
                cryptoPrice: cryptoPrices['BTC'],
              ),
              CoinCard(
                crypto: 'ETH',
                currency: selectedCurrency,
                cryptoPrice: cryptoPrices['ETH'],
              ),
              CoinCard(
                crypto: 'LTC',
                currency: selectedCurrency,
                cryptoPrice: cryptoPrices['LTC'],
              )

            ],
          ),

          Container(
            height: 90.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 20.0),
            color: Colors.lightBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Changed to:',
                  style: CupertinoTheme
                      .of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                CupertinoButton(
                  child: Text(
                    selectedCurrency,
                    style: CupertinoTheme
                        .of(context)
                        .textTheme
                        .textStyle
                        .copyWith(
                        fontSize: 25.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    _showDialog(
                        Platform.isIOS ? iosPicker() : androidDropdown());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CoinCard extends StatelessWidget {

  final String? crypto;
  final String? currency;
  final int? cryptoPrice;

  CoinCard({this.cryptoPrice,this.crypto,this.currency});




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $cryptoPrice $currency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// Platform.isIOS ? iosPicker() : androidDropdown()
