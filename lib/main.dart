import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets/quiz.dart';
import 'const.dart';

void main() => runApp(MyApp());

// 메인 앱은 항상 MaterialApp 혹은 CupertinoApp을 지녀야 함
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:
            defaultTargetPlatform == TargetPlatform.android ? mainColor : null,
      ),
      title: 'Quiz Application',
      home: Intro(),
    );
  }
}

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Outstanding AI',
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                'One logo is real, the other three are AI made.\nPick the one made by human',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 14,
                  fontFamily: 'Roboto',
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
                  color: Colors.transparent,
                  child: new Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      color: subColor,
                      borderRadius: new BorderRadius.circular(36.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Let\'s Start'.toUpperCase(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
