import 'package:flutter/material.dart';

class CustomRoundButton extends RaisedButton {
  final String text;
  final VoidCallback onPressed;
  CustomRoundButton({this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 100.0,
      height: 50.0,
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.blue[200], width: 2.0),
        color: Colors.green,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
