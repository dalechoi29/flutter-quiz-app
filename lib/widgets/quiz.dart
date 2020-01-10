import 'package:flutter/material.dart';

import 'card_list.dart';
import 'result.dart';
import 'progress.dart';
import 'rest_question.dart';
import '../const.dart';

// 퀴즈 페이지를 구성하는 객체
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var _questionIdx = 0;
  var _totalScore = 0;

  var currIcon = new Icon(
    Icons.brightness_1,
    color: Colors.white,
  );

  // 문제를 담고 있는 리스트 객체
  static final List<List<Map<String, Object>>> _questions = [
    [
      {'path': 'assets/images/crown_logo1.png', 'score': 0},
      {'path': 'assets/images/crown_logo2.png', 'score': 1},
      {'path': 'assets/images/crown_logo3.png', 'score': 0},
      {'path': 'assets/images/crown_logo4.png', 'score': 0},
    ],
    [
      {'path': 'assets/images/music1_logo3.png', 'score': 0},
      {'path': 'assets/images/music1_logo4.png', 'score': 0},
      {'path': 'assets/images/music1_logo1.png', 'score': 1},
      {'path': 'assets/images/music1_logo2.png', 'score': 0},
    ],
    [
      {'path': 'assets/images/music2_logo2.png', 'score': 0},
      {'path': 'assets/images/music2_logo3.png', 'score': 0},
      {'path': 'assets/images/music2_logo1.png', 'score': 1},
      {'path': 'assets/images/music2_logo4.png', 'score': 0},
    ],
    [
      {'path': 'assets/images/music3_logo2.png', 'score': 0},
      {'path': 'assets/images/music3_logo3.png', 'score': 0},
      {'path': 'assets/images/music3_logo1.png', 'score': 1},
      {'path': 'assets/images/music3_logo4.png', 'score': 0},
    ],
    [
      {'path': 'assets/images/leaf_logo2.png', 'score': 0},
      {'path': 'assets/images/leaf_logo3.png', 'score': 0},
      {'path': 'assets/images/leaf_logo1.png', 'score': 1},
      {'path': 'assets/images/leaf_logo4.png', 'score': 0},
    ],
    [
      {'path': 'assets/images/animal_logo1.png', 'score': 1},
      {'path': 'assets/images/animal_logo3.png', 'score': 0},
      {'path': 'assets/images/animal_logo2.png', 'score': 0},
      {'path': 'assets/images/animal_logo4.png', 'score': 0},
    ],
    [
      {'path': 'assets/images/typo1_logo2.png', 'score': 0},
      {'path': 'assets/images/typo1_logo3.png', 'score': 0},
      {'path': 'assets/images/typo1_logo4.png', 'score': 0},
      {'path': 'assets/images/typo1_logo1.png', 'score': 1},
    ],
    [
      {'path': 'assets/images/typo2_logo2.png', 'score': 0},
      {'path': 'assets/images/typo2_logo3.png', 'score': 0},
      {'path': 'assets/images/typo2_logo1.png', 'score': 1},
      {'path': 'assets/images/typo2_logo4.png', 'score': 0},
    ],
    [
      {'path': 'assets/images/music4_logo2.png', 'score': 0},
      {'path': 'assets/images/music4_logo3.png', 'score': 0},
      {'path': 'assets/images/music4_logo1.png', 'score': 1},
      {'path': 'assets/images/music4_logo4.png', 'score': 0},
    ],
        [
      {'path': 'assets/images/music5_logo2.png', 'score': 0},
      {'path': 'assets/images/music5_logo3.png', 'score': 0},
      {'path': 'assets/images/music5_logo1.png', 'score': 1},
      {'path': 'assets/images/music5_logo4.png', 'score': 0},
    ],
  ];

  static var tick = 1.0 / (_questions.length.toDouble());
  var _progressValue = tick;

  // 선택에 따라 질문 인덱스와 총합 점수를 변경해주는 함수
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIdx = _questionIdx + 1;
      _progressValue += tick;
    });

    print('Current Score: $_totalScore / ${_questions.length}');
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
      backgroundColor: backColor,
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
                    CardList(_questions[_questionIdx], _answerQuestion),
                  ],
                ),
              ),
            )
          : Result(_totalScore, _questions.length, _resetQuiz, _totalScore.toDouble()),
    );
  }
}
