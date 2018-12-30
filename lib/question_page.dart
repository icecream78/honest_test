import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import './custom_btn.dart';
import 'package:flutter/foundation.dart';

class QuestionPage extends StatefulWidget {
  @override
  State createState() => QuestionPageState();
}

enum Answers { yes, no }

class Question {
  String text;
  Answers answer;

  Question({this.text = '', this.answer = Answers.no});

  Answers _convertJSONAnswer({int answer = 0}) {
    return answer == 0 ? Answers.yes : Answers.no;
  }

  Question.fromJson(Map<String, dynamic> question, {int questionNum = 0}) {
    text = question.containsKey('text') ? question['text'] : '';
    answer = _convertJSONAnswer(
      answer: question.containsKey('answer') ? question['answer'] : 0,
    );
  }
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
      // TODO: add navigation to result page
      return print('Its over');
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
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
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
