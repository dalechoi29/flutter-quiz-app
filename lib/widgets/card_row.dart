import 'package:flutter/material.dart';

import 'img_card.dart';

class CardRow extends StatelessWidget {
  final List<Map<String, Object>> imgs;

  CardRow(this.imgs);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ImageCard(imgs[0]['path']),
        ImageCard(imgs[1]['path']),
      ],
    );
  }
}
