import 'package:flutter/material.dart';

ButtonTheme createTestBtn({
  String text = 'Lets begin',
  @required VoidCallback onPressed,
}) {
  return ButtonTheme(
    minWidth: 100.0,
    height: 50.0,
    child: OutlineButton(
      color: Colors.green,
      // splashColor: Colors.teal,
      textColor: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: onPressed,
    ),
  );
}
