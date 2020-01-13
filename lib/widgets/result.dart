import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'score.dart';
import 'rank.dart';
import 'reset.dart';
import 'meme.dart';
import '../utils.dart';

class Result extends StatefulWidget {
  final int score;
  final int questionNum;
  final Function resetHandler;
  final double rank;

  Result(this.score, this.questionNum, this.resetHandler, this.rank);

  @override
  _ResultState createState() =>
      _ResultState(score, questionNum, resetHandler, rank);
}

// 애니메이션 하나를 추가하기 위해 SingleTickerProviderStateMixin을 구현
class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  final int score;
  final int questionNum;
  final Function resetHandler;

  double rank;
  double tier;
  String tierTitle;
  String tierImg;

  Animation animation;
  AnimationController animationController;

  _ResultState(this.score, this.questionNum, this.resetHandler, this.rank);

  @override
  void initState() {
    tier = score / 10.0;

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

    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
    animation = animationController;

    super.initState();
    animateTier();
  }

  @override
  void dispose() {
    // 본 위젯이 없어질 때, 애니메이션 컨트롤러도 파기시켜야 함 !
    animationController.dispose();
    super.dispose();
  }

  void animateTier() {
    setState(() {
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
                      Score(score, questionNum),
                      Rank(),
                      Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 20),
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
                              Center(
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
                              ),
                            ],
                          ),
                        ),
                      ),
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
}
