import 'package:flutter/material.dart';

import '../utils.dart';

class RestQuestion extends StatelessWidget {
  final int questionIdx;
  final int questionLen;
  final String provocation;

  RestQuestion(this.questionIdx, this.questionLen, this.provocation);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Icon(
              Icons.brightness_1,
              size: 72,
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
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              provocation,
              style: TextStyle(
                  color: mainColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ],
    );
  }
}
