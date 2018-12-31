import 'package:flutter/material.dart';
import '../components/custom_btn.dart';
import '../themes.dart';

class FinishPage extends StatelessWidget {
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
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  'Test results',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline,
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
                    style: Theme.of(context).textTheme.body2,
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
