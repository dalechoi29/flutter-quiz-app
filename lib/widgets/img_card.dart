import 'package:flutter/material.dart';

// 개별 이미지 하나를 담는 객체
class ImageCard extends StatelessWidget {
  final String imgPath;

  ImageCard(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // return IconButton(
    //   icon: Image.asset(imgPath),
    //   iconSize: 50,
    //   color: Colors.black,
    //   onPressed: () {
    //     this.color = Colors.black;
    //   },
    // );
    return Container(
      width: 152,
      height: 152,
      child: Card(
        child: GestureDetector(
          onTap: () => print('test'),
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
