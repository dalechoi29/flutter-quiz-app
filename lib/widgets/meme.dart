import 'package:flutter/material.dart';

class Meme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Are you an AI?',
                style: TextStyle(
                  color: Color(0xFF006064),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              child: Text(
                'It\'s hard to think otherwise',
                style: TextStyle(
                  color: Color(0xFF006064).withOpacity(0.45),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/meme.png',
                  height: 154,
                  width: 270,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
