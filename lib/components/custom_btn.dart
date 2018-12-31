import 'package:flutter/material.dart';

const Color defaultBorderColor = Color(0xFF90CAF9);
const TextStyle defaultTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
);

class CustomRoundButton extends RaisedButton {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double minWidth;
  final double borderRadius;
  final TextStyle textStyle;

  CustomRoundButton({
    this.text = 'Click me',
    @required this.onPressed,
    this.color = defaultBorderColor,
    this.minWidth = 100.0,
    this.borderRadius = 10.0,
    this.textStyle = defaultTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: minWidth,
      height: 50.0,
      child: OutlineButton(
        borderSide: BorderSide(color: color, width: 2.0),
        color: Colors.green,
        child: Text(
          text,
          // style: TextStyle(
          //   fontSize: 20.0,
          //   color: Colors.white,
          // ),
          style: textStyle,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
