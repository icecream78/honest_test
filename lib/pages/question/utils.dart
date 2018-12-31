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
