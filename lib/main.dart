import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './themes.dart';
import './pages/start_page.dart';
import './pages/question/question_page.dart';
import './pages/finish_page.dart';

void main() {
  runApp(HonestTestApp());
}

class HonestTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Faker chat",
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home: StartPage(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/start':
            return MaterialPageRoute(
              builder: (_) => StartPage(),
              settings: settings,
            );

          case '/questions':
            return MaterialPageRoute(
              builder: (_) => QuestionPage(),
              settings: settings,
            );

          case '/finish':
            return MaterialPageRoute(
              builder: (_) => FinishPage(),
              settings: settings,
            );
        }
      },
    );
  }
}
