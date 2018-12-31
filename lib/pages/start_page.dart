import 'package:flutter/material.dart';
import '../components/custom_btn.dart';
import '../themes.dart';

void main() => runApp(StartPage());

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity, // full width widget
          decoration: appGradientBg,
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
