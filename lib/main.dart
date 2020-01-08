import 'package:flutter/material.dart';

import 'widgets/quiz.dart';

void main() => runApp(MyApp());

// 메인 앱은 항상 MaterialApp 혹은 CupertinoApp을 지녀야 함
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Application',
      home: Intro(),
    );
  }
}

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Outstanding AI',
                style: TextStyle(
                  color: Color(0xFF006064),
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                'One logo is real, the other three are AI made.\n Pick the one made by human',
                style: TextStyle(
                  color: Color(0xFF006064),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                ),
              ),
              Image.asset('assets/images/intro.png'),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
                  color: Color(0xFF00838F),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'START',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
