import 'package:flutter/material.dart';

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
                padding: EdgeInsets.only(bottom: 80.0),
              ),
              Image.asset(
                'assets/logo.jpg',
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 60.0),
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 50.0,
                child: OutlineButton(
                  color: Colors.green,
                  // splashColor: Colors.teal,
                  textColor: Colors.white,
                  child: Text(
                    'Lets begin',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/questions');
                  },
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
