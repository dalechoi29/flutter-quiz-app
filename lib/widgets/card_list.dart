import 'package:flutter/material.dart';

import 'card_row.dart';

class CardList extends StatelessWidget {
  final List<Map<String, Object>> currQuestion;
  final Function answerQuestion;

  CardList(this.currQuestion, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    // 카드 리스트는 칼럼에 2개의 로우가 들어가 있는 구조
    // 각각의 로우는 다시 2개의 개별 이미지를 지님
    return Column(
      children: <Widget>[
        CardRow(currQuestion.sublist(0, 2), answerQuestion), // 0, 1번째 이미지 주소 전달
        CardRow(currQuestion.sublist(2, 4), answerQuestion), // 2, 3번째 이미지 주소 전달
      ],
    );
  }
}
