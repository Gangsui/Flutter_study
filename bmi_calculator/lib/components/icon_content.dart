import 'package:flutter/material.dart';
import '../constants.dart';


class insideIcon extends StatelessWidget {
  insideIcon({required this.iconInside, required this.strInside});
  final IconData iconInside;
  final String strInside;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconInside,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(strInside, style: kLabelTextstyle),
      ],
    );
  }
}
