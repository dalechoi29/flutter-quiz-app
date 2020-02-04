import 'dart:async';

import 'package:flutter/material.dart';

// 사용자의 최종 점수를 보여주는 카드 위젯
class Score extends StatelessWidget {
  final StreamController<double> avgScoreController;
  final int score;
  final int questionNum;

  Score(this.avgScoreController, this.score, this.questionNum);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Game Score',
                        style: TextStyle(
                          color: Color(0xFF006064),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Container(
                      height: 72,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '${score * 10}',
                              style: TextStyle(
                                color: Color(0xFF006064),
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            Text(
                              '/ ${questionNum * 10}',
                              style: TextStyle(
                                color: Color(0xFF006064).withOpacity(0.45),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ]),
                    ),
                  ]),
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Avg. Score',
                        style: TextStyle(
                          color: Color(0xFF006064),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    Container(
                      height: 72,
                      child: StreamBuilder<double>(
                          stream: avgScoreController.stream,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator(),);
                            } else {
                              print(snapshot.data);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '${snapshot.data}',
                                    style: TextStyle(
                                      color: Color(0xFF006064),
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Text(
                                    '/ ${questionNum * 10}',
                                    style: TextStyle(
                                      color:
                                          Color(0xFF006064).withOpacity(0.45),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ],
                              );
                            }
                          }),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
