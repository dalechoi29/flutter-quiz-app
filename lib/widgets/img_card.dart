import 'package:flutter/material.dart';
import 'package:quiz_app/const.dart';

class ImageCard extends StatefulWidget {
  final String imgPath;
  ImageCard(this.imgPath);
  @override
  _ImageCardState createState() => _ImageCardState(imgPath);
}

class _ImageCardState extends State<ImageCard> {
  var currIcon = new Icon(
    Icons.brightness_1,
    color: Colors.white,
  );
  final String imgPath;

  _ImageCardState(this.imgPath);

  @override
  Widget build(BuildContext context) {
    print(imgPath);
    return Container(
      width: 152,
      height: 152,
      child: Card(
        color: Colors.blue[300],
        child: GestureDetector(
          onTap: () {
            print('test');
            currIcon = new Icon(
              Icons.check_circle,
              color: mainColor,
            );
            ;
          },
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Image.asset(imgPath),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    currIcon,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 개별 이미지 하나를 담는 객체
// class ImageCard extends StatelessWidget {
//   final String imgPath;
//   var currIcon = Icons.brightness_1;

//   ImageCard(this.imgPath);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 152,
//       height: 152,
//       child: Card(
//         color: Colors.blue[300],
//         child: GestureDetector(
//           onTap: () {
//             print('test');
//             currIcon = Icons.child_care;
//           },
//           child: Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(top: 8),
//                 child: Image.asset(imgPath),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Icon(
//                     currIcon,
//                     color: Color(0xFF006064),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
