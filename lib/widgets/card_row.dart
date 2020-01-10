import 'package:flutter/material.dart';

import 'img_card.dart';

class CardRow extends StatelessWidget {
  final List<Map<String, Object>> imgs;
  final Function answerQuestion;

  CardRow(this.imgs, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    // 로우는 2개의 이미지를 지니고 있는 위젯
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ImageCard(imgs[0], answerQuestion),
        ImageCard(imgs[1], answerQuestion),
      ],
    );
  }
}
