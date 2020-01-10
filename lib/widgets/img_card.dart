import 'package:flutter/material.dart';

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
        child: GestureDetector(
          onTap: () {
            answerQuestion(img['score']);
          },
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Image.asset(img['path']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
