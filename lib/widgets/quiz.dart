import 'package:flutter/material.dart';

// import 'card_list.dart';
import 'img_card.dart';
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
  var _totalScore = 0;
  var _defaultText = 'CHECK';

  var currIcon = new Icon(
    Icons.brightness_1,
    color: Colors.white,
  );

  // 문제를 담고 있는 리스트 객체
  static final List<List> _questions = [
    [
      {'path': 'assets/images/crown_logo1.png', 'isTrue': 1},
      {'path': 'assets/images/crown_logo2.png', 'isTrue': 0},
      {'path': 'assets/images/crown_logo3.png', 'isTrue': 0},
      {'path': 'assets/images/crown_logo4.png', 'isTrue': 0},
    ],
    [
      {'path': 'assets/images/music1_logo3.png', 'isTrue': 0},
      {'path': 'assets/images/music1_logo4.png', 'isTrue': 1},
      {'path': 'assets/images/music1_logo1.png', 'isTrue': 0},
      {'path': 'assets/images/music1_logo2.png', 'isTrue': 0},
    ],
    [
      {'path': 'assets/images/music2_logo2.png', 'isTrue': 0},
      {'path': 'assets/images/music2_logo3.png', 'isTrue': 1},
      {'path': 'assets/images/music2_logo1.png', 'isTrue': 0},
      {'path': 'assets/images/music2_logo4.png', 'isTrue': 0},
    ],
    [
      {'path': 'assets/images/music3_logo2.png', 'isTrue': 0},
      {'path': 'assets/images/music3_logo3.png', 'isTrue': 1},
      {'path': 'assets/images/music3_logo1.png', 'isTrue': 0},
      {'path': 'assets/images/music3_logo4.png', 'isTrue': 0},
    ],
    [
      {'path': 'assets/images/leaf_logo2.png', 'isTrue': 0},
      {'path': 'assets/images/leaf_logo3.png', 'isTrue': 1},
      {'path': 'assets/images/leaf_logo1.png', 'isTrue': 0},
      {'path': 'assets/images/leaf_logo4.png', 'isTrue': 0},
    ],
  ];

  static var tick = 1.0 / (_questions.length.toDouble());
  var _progressValue = tick;

  // 다음 문제로 가는 함수
  void _nextQuestion() {
    setState(() {
      _questionIdx += 1;
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
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 152,
                              height: 152,
                              child: Card(
                                color: Colors.blue[300],
                                child: GestureDetector(
                                  onTap: () {
                                    print('test');
                                    currIcon = new Icon(
                                      Icons.check_circle,
                                      color: mainColor,
                                    );
                                    ;
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Image.asset(
                                            _questions[_questionIdx][0]
                                                ['path']),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            currIcon,
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 152,
                              height: 152,
                              child: Card(
                                color: Colors.blue[300],
                                child: GestureDetector(
                                  onTap: () {
                                    print('test');
                                    currIcon = new Icon(
                                      Icons.check_circle,
                                      color: mainColor,
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Image.asset(
                                            _questions[_questionIdx][1]
                                                ['path']),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            currIcon,
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 152,
                              height: 152,
                              child: Card(
                                color: Colors.blue[300],
                                child: GestureDetector(
                                  onTap: () {
                                    print('test');
                                    currIcon = new Icon(
                                      Icons.check_circle,
                                      color: mainColor,
                                    );
                                    ;
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Image.asset(
                                            _questions[_questionIdx][2]
                                                ['path']),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            currIcon,
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 152,
                              height: 152,
                              child: Card(
                                color: Colors.blue[300],
                                child: GestureDetector(
                                  onTap: () {
                                    print('test');
                                    currIcon = new Icon(
                                      Icons.check_circle,
                                      color: mainColor,
                                    );
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Image.asset(
                                            _questions[_questionIdx][3]
                                                ['path']),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            currIcon,
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // CardList(_questions[_questionIdx]),
                    Container(
                      height: 48,
                      width: 360,
                      color: Colors.transparent,
                      child: new Container(
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          color: subColor,
                          borderRadius: new BorderRadius.circular(36.0),
                        ),
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
