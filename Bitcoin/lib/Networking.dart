import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking({this.selctedBitcoin, this.selectedCurrency});

  String? selctedBitcoin;
  String? selectedCurrency;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$selctedBitcoin/$selectedCurrency?apikey=$apiKey'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
