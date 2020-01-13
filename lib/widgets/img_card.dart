import 'package:flutter/material.dart';

import '../utils.dart';

// 개별 이미지 하나를 담는 객체
class ImageCard extends StatelessWidget {
  final Map<String, Object> img;
  final Function answerQuestion;

  ImageCard(this.img, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 152,
      child: Card(
        child: InkWell(
          splashColor: mainColor,
          onTap: () {
            answerQuestion(img['score']);
          },
          child: Container(
            child: Image.asset(
              img['path'],
              width: 150,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
