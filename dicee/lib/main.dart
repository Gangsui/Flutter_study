import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.redAccent,


        ),
        body: const DicePage(),
      ),
    ),
  );
}



class  DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _State();
}

class _State extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override

  Widget build(BuildContext context) {


    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                child: Image.asset('images/dice$leftDiceNumber.png'),
                onTap: () {
                  random();
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                child: Image.asset('images/dice$rightDiceNumber.png'),
                onTap: () {
                  random();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void random() {  setState(() {
  leftDiceNumber = Random().nextInt(6)+1;
  rightDiceNumber = Random().nextInt(6)+1;
});}


}



