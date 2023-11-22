import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('이시하라 사토미'),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
              'https://i.namu.wiki/i/sK4rkesCKHgv2MLayX0U71Qyx7k37z1g-q5Cxslh970CAOFZFKVIR7OwFQevM3L0gOMmiMFn88-mkD7Nb4Pt8LpcRRX0KUH3FyvW6DpTxwtwwwTqxXccD7ytJMHFeaRdC3sxEoOhDEqby_8CQEXrsw.webp'),
          fit: BoxFit.cover,
        ),
      ),backgroundColor: Colors.amberAccent[200],
    ),
  ));
}
