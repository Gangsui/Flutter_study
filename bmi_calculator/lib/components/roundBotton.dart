import 'package:flutter/material.dart';

class RoundClick extends StatelessWidget {
  RoundClick({required this.iconData, this.onPress});
  final IconData iconData;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(iconData),
      constraints: BoxConstraints(minWidth: 88.0, minHeight: 36.0),
      shape: CircleBorder(),
    );
  }
}