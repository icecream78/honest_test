import 'package:flutter/material.dart';
import './custom_btn.dart';

class FinishPage extends StatelessWidget {
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
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  'Test results',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  'assets/logo.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
                child: Center(
                  child: Text(
                    'Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века.',
                    maxLines: 40,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: CustomRoundButton(
                  color: Colors.white,
                  text: 'Try again',
                  minWidth: 250.0,
                  borderRadius: 30.0,
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/start'),
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
