import 'dart:async';

import 'package:flutter/material.dart';

// 사용자의 순위를 보여주는 카드
class Rank extends StatelessWidget {
  final StreamController<int> playedCntController;

  Rank({Key key, this.playedCntController}) : super(key: key);

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
                'Your Rank',
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
                'Are you sure you\'re a human?',
                style: TextStyle(
                  color: Color(0xFF006064).withOpacity(0.45),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                  child: StreamBuilder<int>(
                      stream: playedCntController.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Text(
                            (snapshot.data < 5)
                                ? 'Play more :)'
                                : 'Plz wait..',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF006064),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          );
                        }
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
