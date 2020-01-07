import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imgPath;

  ImageCard(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 152,
      // Card라는 Pre-defined keyword
      child: Card(
        child: InkWell(
          splashColor: Colors.blue,
          onTap: () => print('test'),
          child: Column(
            children: <Widget>[
              Image.asset(imgPath),
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
