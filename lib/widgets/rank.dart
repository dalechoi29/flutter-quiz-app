import 'package:flutter/material.dart';

// 사용자의 순위를 보여주는 카드
class Rank extends StatelessWidget {
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
              child: Text(
                'Are you sure you\'re a human?',
                style: TextStyle(
                  color: Color(0xFF006064).withOpacity(0.45),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '211,250',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF006064),
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}