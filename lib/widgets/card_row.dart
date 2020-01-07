import 'package:flutter/material.dart';

import 'img_card.dart';

class CardRow extends StatelessWidget {
  final List<String> imgs;

  CardRow(this.imgs);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ImageCard(imgs[0]),
        ImageCard(imgs[1]),
      ],
    );
  }
}
