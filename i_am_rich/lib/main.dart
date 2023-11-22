import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.png'),
          ),
        ),
        appBar: AppBar(
          title: Text('인서'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        backgroundColor: Colors.blueGrey,
      ),
    ),
  );
}
