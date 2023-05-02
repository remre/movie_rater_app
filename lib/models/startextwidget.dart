import  'package:flutter/material.dart';


class StarTexts extends StatelessWidget {
  const StarTexts(
      this.textit
      );
  final String textit;

  @override
  Widget build(BuildContext context) {
    return Text(textit,
      style: TextStyle(fontSize: 20),);
  }
}

