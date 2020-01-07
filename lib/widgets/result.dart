import 'package:flutter/material.dart';

import 'score.dart';
import 'rank.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;

  Result(this.score, this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                Score(score),
                Rank(),
                FlatButton(
                  onPressed: resetHandler,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    color: Color(0xFF00838F),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
