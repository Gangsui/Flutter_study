import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ask Me Anything',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.blue.shade900,
        ),
        body: main_body(),
        backgroundColor: Colors.lightBlue.shade200,
      ),
    ),
  );
}

class main_body extends StatefulWidget {
  const main_body({super.key});

  @override
  State<main_body> createState() => _main_bodyState();
}

class _main_bodyState extends State<main_body> {
  int click = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset('Images/ball$click.png',),
        onTap: (){
          setState(() {
          click=Random().nextInt(5)+1;
          });

        },
      ),
    );
  }
}
