import 'package:flutter/material.dart';

import 'score.dart';
import 'rank.dart';
import '../const.dart';

// 사용자의 결과를 보여주는 페이지 위젯
class Result extends StatelessWidget {
  final int score;
  final int questionNum;
  final Function resetHandler;

  Result(this.score, this.questionNum, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                Score(score, questionNum),
                Rank(),
                FlatButton(
                  onPressed: resetHandler,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Container(
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: subColor,
                        borderRadius: new BorderRadius.circular(36.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Transform.rotate(
                            angle: 180 * 3.14 / 180,
                            child: Icon(
                              Icons.replay,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'TRY AGAIN',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
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
      ),
    );
  }
}
