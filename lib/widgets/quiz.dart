import 'dart:math';

import 'package:flutter/material.dart';

import 'card_list.dart';
import 'result.dart';
import 'progress.dart';
import 'rest_question.dart';
import '../utils.dart';

// 퀴즈 페이지를 구성하는 객체
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var _questionIdx = 0;
  var _totalScore = 0;

  var _rng = new Random();
  var _provIdx = 0;

  final List<String> _provocations = [
    'You won\'t beat AI :-)',
    'Looooooooser :P',
    'You\'d better google it !',
    'You are so bad at this !',
    'Dumb assssssss :-P',
  ];

  // 문제를 담고 있는 리스트 객체
  static final List<List<Map<String, Object>>> _questions = [
    buildQuiz('crown', 2),
    buildQuiz('music1', 1),
    buildQuiz('music2', 1),
    buildQuiz('music3', 1),
    buildQuiz('music4', 1),
    buildQuiz('music5', 1),
    buildQuiz('leaf', 1),
    buildQuiz('animal', 1),
    buildQuiz('typo1', 1),
    buildQuiz('typo2', 1),
  ];

  static var tick = 1.0 / (_questions.length.toDouble());
  var _progressValue = tick;

  // 선택에 따라 질문 인덱스와 총합 점수를 변경해주는 함수
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIdx = _questionIdx + 1;
      _progressValue += tick;
      _provIdx = _rng.nextInt(_provocations.length - 1);
    });

    print('Current Score: $_totalScore / ${_questions.length}');
  }

  @override
  void initState() {
    super.initState();
    // 시작 시, 질문 목록 셔플
    _questions.shuffle();
    _questions.forEach((e) => e.shuffle());
  }

  // 퀴즈를 초기화 하는 함수
  void _resetQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
      _progressValue = tick;

      // 매 게임마다 질문 목록 셔플
      _questions.shuffle();
      _questions.forEach((e) => e.shuffle());
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
                    RestQuestion(_questionIdx, _questions.length,
                        _provocations[_provIdx]),
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
          : Result(_totalScore, _questions.length, _resetQuiz,
              _totalScore.toDouble()),
    );
  }
}
