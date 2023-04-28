import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.colour, required this.bTitle, required this.NextScreen});

  final Color colour;
  final String bTitle;
  final VoidCallback NextScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: NextScreen,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            bTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
