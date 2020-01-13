import 'package:flutter/material.dart';

import '../utils.dart';

class CardList extends StatelessWidget {
  final List<Map<String, Object>> currQ;
  final Function answerQ;

  CardList(this.currQ, this.answerQ);

  @override
  Widget build(BuildContext context) {
    // 카드 리스트는 칼럼에 2개의 로우가 들어가 있는 구조
    // 각각의 로우는 다시 2개의 개별 이미지를 지님
    return Column(
      children: <Widget>[
        _buildRow(currQ.sublist(0, 2), answerQ), // 0, 1번째 이미지 주소 전달
        _buildRow(currQ.sublist(2, 4), answerQ), // 2, 3번째 이미지 주소 전달
      ],
    );
  }

  // Column 내 아이템이 될 Card Row를 생성해주는 함수
  Widget _buildRow(imgs, answerQ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildCard(imgs[0], answerQ),
        _buildCard(imgs[1], answerQ),
      ],
    );
  }

  // Row 내 Card를 생성해주는 함수
  Widget _buildCard(img, answerQ) {
    return Container(
      width: 152,
      height: 152,
      child: Card(
        child: InkWell(
          splashColor: mainColor,
          onTap: () => answerQ(img['score']),
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
