import 'package:flutter/material.dart';

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
  textTheme: TextTheme(
    body1: TextStyle(
      fontSize: 25.0,
      color: Colors.white,
    ),
    body2: TextStyle(
      fontSize: 20.0,
      color: Colors.white,
    ),
    headline: TextStyle(
      fontSize: 40.0,
      color: Colors.white,
    ),
  ),
);

final BoxDecoration appGradientBg = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.1, 0.5, 0.7, 0.9],
    colors: [
      Colors.indigo[800],
      Colors.red[700],
      Colors.indigo[400],
      Colors.indigo[500],
    ],
    tileMode: TileMode.repeated,
  ),
);
