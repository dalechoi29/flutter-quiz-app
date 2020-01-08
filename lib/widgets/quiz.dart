import 'package:flutter/material.dart';

import 'card_list.dart';
import 'result.dart';
import 'progress.dart';
import 'rest_question.dart';

import '../models/question.dart';
import '../const.dart';

// 퀴즈 페이지를 구성하는 객체
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var _questionIdx = 0;
  var _totalScore = 1;
  var _defaultText = 'CHECK';

  // 문제를 담고 있는 리스트 객체
  static final List<Question> _questions = [
    Question([
      {'path': 'assets/images/logo1.png', 'isTrue': true},
      {'path': 'assets/images/logo2.png', 'isTrue': false},
      {'path': 'assets/images/logo3.png', 'isTrue': false},
      {'path': 'assets/images/logo4.png', 'isTrue': false},
    ]),
    Question([
      {'path': 'assets/images/logo3.png', 'isTrue': false},
      {'path': 'assets/images/logo4.png', 'isTrue': true},
      {'path': 'assets/images/logo1.png', 'isTrue': false},
      {'path': 'assets/images/logo2.png', 'isTrue': false},
    ]),
    Question([
      {'path': 'assets/images/logo2.png', 'isTrue': false},
      {'path': 'assets/images/logo3.png', 'isTrue': true},
      {'path': 'assets/images/logo1.png', 'isTrue': false},
      {'path': 'assets/images/logo4.png', 'isTrue': false},
    ]),
  ];

  static var tick = 1.0 / (_questions.length.toDouble());
  var _progressValue = tick;

  // 다음 문제로 가는 함수
  void _nextQuestion() {
    setState(() {
      _questionIdx += 1;
      print(_questionIdx);
      _progressValue += tick;
    });
  }

  // 퀴즈를 초기화 하는 함수
  void _resetQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
      _progressValue = tick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _questionIdx < _questions.length
          ? Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Progress(_progressValue),
                    RestQuestion(_questionIdx, _questions.length),
                    Text(
                      'Pick one you think is made by human.',
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Roboto'),
                    ),
                    CardList(_questions[_questionIdx]),
                    Container(
                      height: 48,
                      width: 360,
                      color: subColor,
                      child: FlatButton(
                        child: Text(
                          _defaultText,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        onPressed: _nextQuestion,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Result(_totalScore, _questions.length, _resetQuiz),
    );
  }
}
