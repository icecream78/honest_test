import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import './utils.dart';
import '../../components/custom_btn.dart';
import '../../themes.dart';

class QuestionPage extends StatefulWidget {
  @override
  State createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  List<Question> _questions = [];
  Question _currQuestion = Question();
  int _currQuestionNum = 1;
  int _totalQuestionCount = 1;
  int _totalRightAnswers = 0;
  bool successLoad = true;

  @override
  void initState() {
    super.initState();
    this.asyncInitState();
  }

  void asyncInitState() async {
    final questionList = await loadQuestions();
    setState(() {
      _questions = questionList;
      _totalQuestionCount = questionList.length;
      successLoad = questionList.isNotEmpty;
      if (successLoad) {
        _currQuestion = questionList[0];
      }
    });
  }

  void answerSelectedHandler({@required Answers selectedAnswer}) {
    if (_currQuestionNum == _totalQuestionCount) {
      Navigator.pushReplacementNamed(context, '/finish');
      return;
    }

    setState(() {
      _currQuestionNum += 1;
      _currQuestion = _questions[_currQuestionNum - 1];
      _totalRightAnswers += selectedAnswer == Answers.yes ? 1 : 0;
    });
  }

  Future<List<Question>> loadQuestions() async {
    try {
      final data = await rootBundle.loadString('assets/questions.json');
      final parsedData = json.decode(data);
      return List.from(parsedData['questions'])
          .map((el) => Question.fromJson(el))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: appGradientBg,
          child: Theme(
            data: ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle: TextStyle(color: Colors.tealAccent, fontSize: 25.0),
              ),
            ),
            isMaterialAppTheme: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                ),
                // header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            '$_currQuestionNum/$_totalQuestionCount',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: CustomRoundButton(
                        text: 'Try again',
                        onPressed: () =>
                            Navigator.pushReplacementNamed(context, '/start'),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _currQuestion.text,
                        // maxLines: (constraints.maxHeight / Theme.of(context).textTheme.body1.fontSize).floor(), // crunch for displaying long text
                        maxLines: 80,
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CustomRoundButton(
                        text: 'Yeap',
                        onPressed: () =>
                            answerSelectedHandler(selectedAnswer: Answers.yes),
                      ),
                      CustomRoundButton(
                        text: 'Nope',
                        onPressed: () =>
                            answerSelectedHandler(selectedAnswer: Answers.no),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
