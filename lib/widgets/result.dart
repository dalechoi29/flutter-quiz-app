import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:rxdart/rxdart.dart';

import 'score.dart';
import 'rank.dart';
import 'reset.dart';
import 'meme.dart';
import '../utils.dart';

class Result extends StatefulWidget {
  final FirebaseUser user;
  final int score;
  final int questionNum;
  final Function resetHandler;
  final double rank;

  Result(this.user, this.score, this.questionNum, this.resetHandler, this.rank);

  @override
  _ResultState createState() =>
      _ResultState(score, questionNum, resetHandler, rank);
}

// 애니메이션 하나를 추가하기 위해 SingleTickerProviderStateMixin을 구현
class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  //* 평균 데이터를 가져오기 위해 Controller 사용.
  //* 그러나 일반 StreamController를 사용하니, UI에서 계속 에러가 남.
  //* 그래서 rxdart의 BehaviorSubject를 가져옴
  final StreamController<double> _avgScoreController = BehaviorSubject();
  final StreamController<int> _playedCntController = BehaviorSubject();
  final int score;
  final int questionNum;
  final Function resetHandler;

  double rank;
  double tier;
  String tierTitle = 'Checking...';
  String tierImg;

  Animation animation;
  AnimationController animationController;

  _ResultState(this.score, this.questionNum, this.resetHandler, this.rank);

  @override
  void initState() {
    super.initState();

    //* DB와 연동 (이번 결과 및 유저 누적 결과)
    result();
  }

  @override
  void dispose() {
    // 본 위젯이 없어질 때, 애니메이션 컨트롤러도 파기시켜야 함 !
    animationController.dispose();
    _avgScoreController.close();
    _playedCntController.close();
    super.dispose();
  }

  void animateTier() {
    setState(() {
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Total Result",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Flexible(
                  child: ListView(
                    children: <Widget>[
                      Score(
                        _avgScoreController,
                        score,
                        questionNum,
                      ),
                      Rank(
                        playedCntController: _playedCntController,
                      ),
                      tierCard(),
                      Meme(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
              ),
              ResetButton(resetHandler),
            ],
          ),
        ),
      ),
    );
  }

  //* DB 저장하고 데이터 가져오기
  Future<void> result() async {
    var doc = Firestore.instance.collection('result').document();
    doc.setData({
      'id': doc.documentID,
      'email': widget.user.email,
      'displayName': widget.user.displayName,
      'andid': widget.user.uid,
      'phoneNumber': widget.user.phoneNumber,
      'Score': score * 10,
      'timePlayed': DateTime.now(),
    }).then((onValue) => print('db upload completed!'));

    var userDoc =
        Firestore.instance.collection('user_avg').document(widget.user.email);
    print("check start");
    userDoc.get().then((DocumentSnapshot ds) {
      if (ds.data != null) {
        userDoc.updateData({
          'playedCnt': ds.data['playedCnt'] + 1,
          'avgScore':
              (ds.data['avgScore'] * ds.data['playedCnt'] + score * 10) /
                  (ds.data['playedCnt'] + 1),
          'lastUpdated': DateTime.now(),
        }).then((onValue) {
          print(ds.data);
          var avgScore =
              (ds.data['avgScore'] * ds.data['playedCnt'] + score * 10) /
                  (ds.data['playedCnt'] + 1);
          _avgScoreController.add((avgScore * 10).round() / 10);

          var playedCnt = ds.data['playedCnt'] + 1;
          _playedCntController.add(playedCnt);
        });
      } else {
        userDoc.setData({
          'id': widget.user.email,
          'email': widget.user.email,
          'displayName': widget.user.displayName,
          'andid': widget.user.uid,
          'phoneNumber': widget.user.phoneNumber,
          'avgScore': score.toDouble() * 10,
          'playedCnt': 1,
          'lastUpdated': DateTime.now(),
        }).then((onValue) {
          var avgScore = score.toDouble() * 10;
          _avgScoreController.add(avgScore);

          var playedCnt = 1;
          _playedCntController.add(playedCnt);
        });
      }
    });
    print("check end");
  }

  Widget tierCard() {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Tier $tierTitle',
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
                'Your rank leads you to somewhere over here',
                style: TextStyle(
                  color: Color(0xFF006064).withOpacity(0.45),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            StreamBuilder<double>(
                stream: _avgScoreController.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    setState(() {
                      //* DB에서 데이터를 받아와 Tier를 설정해줌
                      tier = snapshot.data / 100.0;

                      if (tier < 0.3) {
                        tierTitle = 'Bronze';
                        tierImg = 'assets/images/medal3.png';
                      } else if (tier >= 0.3 && tier < 0.6) {
                        tierTitle = 'Silver';
                        tierImg = 'assets/images/medal2.png';
                      } else {
                        tierTitle = 'Gold';
                        tierImg = 'assets/images/medal1.png';
                      }

                      //* 애니메이션 컨트롤러 부분
                      animationController = AnimationController(
                        vsync: this,
                        duration: Duration(
                          milliseconds: 1000,
                        ),
                      );
                      // animation = animationController;

                      //----------- 여기까지 원래 initState에 있었음. 이후 animateTier함수 부름--------------------------

                      // 초기 값과 결과 값을 정의해준 후,
                      animation = Tween<double>(
                        begin: 0.0,
                        end: tier,
                      ).animate(CurvedAnimation(
                        curve: Curves.fastOutSlowIn,
                        parent: animationController,
                      ));

                      // 애니메이션이 리스닝하게 함
                      animation.addListener(() {
                        setState(() {});
                      });

                      animationController.forward();
                    });
                    
                    return Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 28,
                          bottom: 5,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 190,
                              lineWidth: 10,
                              percent: animation.value,
                              progressColor: mainColor,
                            ),
                            Image.asset(
                              tierImg,
                              height: 120,
                              width: 120,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
