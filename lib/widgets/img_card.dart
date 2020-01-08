import 'package:flutter/material.dart';

// 개별 이미지 하나를 담는 객체
class ImageCard extends StatelessWidget {
  final String imgPath;

  ImageCard(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 152,
      child: Card(
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Image.asset(imgPath),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFF006064),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
