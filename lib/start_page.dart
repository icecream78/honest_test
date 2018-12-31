import 'package:flutter/material.dart';
import './custom_btn.dart';

void main() => runApp(StartPage());

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity, // full width widget
          decoration: BoxDecoration(
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
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Image.asset(
                  'assets/logo.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: CustomRoundButton(
                  color: Colors.white,
                  text: 'Lets begin',
                  minWidth: 250.0,
                  borderRadius: 30.0,
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/questions'),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
