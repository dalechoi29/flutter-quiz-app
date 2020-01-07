import 'package:flutter/material.dart';

import 'models/question.dart';

import 'widgets/card_list.dart';
import 'widgets/result.dart';

void main() => runApp(MyApp());

// 메인 앱은 항상 MaterialApp 혹은 CupertinoApp을 지녀야 함
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Application',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _questionIdx = 0;

  List<Question> _questions = [
    Question([
      {'path': 'assets/images/logo1.png', 'isTrue': true},
      {'path': 'assets/images/logo2.png', 'isTrue': false},
      {'path': 'assets/images/logo3.png', 'isTrue': false},
      {'path': 'assets/images/logo4.png', 'isTrue': false},
    ]),
    Question([
      'assets/images/logo3.png',
      'assets/images/logo4.png',
      'assets/images/logo1.png',
      'assets/images/logo2.png',
    ]),
  ];

  void _nextQuestion() {
    setState(() {
      _questionIdx += 1;
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
                    Text(
                      'Timer locates here',
                    ),
                    Row(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/circle.png'),
                            Center(
                              child: Text(
                                '${_questionIdx+1} / ${_questions.length}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Are you sure?',
                            style: TextStyle(
                                color: Color(0xFF006064),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Pick one you think is made by human.',
                      style: TextStyle(
                          color: Color(0xFF006064),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Roboto'),
                    ),
                    CardList(_questions[_questionIdx]),
                    FlatButton(
                      child: Text('CHECK'),
                      onPressed: _nextQuestion,
                    )
                  ],
                ),
              ),
            )
          : Result(),
    );
  }
}
