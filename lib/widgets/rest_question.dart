import 'package:flutter/material.dart';

import '../const.dart';

class RestQuestion extends StatelessWidget {
  final int questionIdx;
  final int questionLen;

  RestQuestion(this.questionIdx, this.questionLen);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Icon(
              Icons.brightness_1,
              size: 52,
              color: mainColor,
            ),
            Center(
              child: Text(
                '${questionIdx + 1} / $questionLen',
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
            'You won\'t beat AI :-)',
            style: TextStyle(
                color: mainColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat'),
          ),
        ),
      ],
    );
  }
}
