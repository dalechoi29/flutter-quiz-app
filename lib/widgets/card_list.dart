import 'package:flutter/material.dart';

import 'card_row.dart';
import '../models/question.dart';

class CardList extends StatelessWidget {
  final Question currQuestion;

  CardList(this.currQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardRow(currQuestion.files.sublist(0, 2)),  // 0, 1번째 이미지 주소 전달
        CardRow(currQuestion.files.sublist(2, 4)),  // 2, 3번째 이미지 주소 전달
      ],
    );
  }
}