import 'package:flutter/material.dart';

// 사용자의 최종 점수를 보여주는 카드 위젯
class Score extends StatelessWidget {
  final int score;
  final int questionNum;

  Score(this.score, this.questionNum);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  'Average Score',
                  style: TextStyle(
                    color: Color(0xFF006064),
                    fontSize: 24,
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
                          fontSize: 72,
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
    );
  }
}
