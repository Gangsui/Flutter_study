import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  final String bottomText;
  final void Function()? onTap;
  BottomButton({required this.onTap,required this.bottomText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomColor,
        child: Center(
          child: Text(
            bottomText,
            style: kBottomTextstyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeigh,
        padding: EdgeInsets.only(bottom: 15.0),
      ),
    );
  }
}