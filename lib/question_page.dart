import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuestionPage extends StatefulWidget {
  @override
  State createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  List _questions = [];
  bool successLoad = true;

  @override
  void initState() async {
    super.initState();
    successLoad = await loadQuestions();
  }

  Future<bool> loadQuestions() async {
    try {
      final data = await rootBundle.loadString('assets/questions.json');
      final parsedData = json.decode(data);
      _questions = parsedData['questions'];
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Text('data'),
      ),
    );
  }
}
