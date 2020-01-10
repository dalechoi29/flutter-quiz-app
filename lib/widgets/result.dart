import 'package:flutter/material.dart';

import 'score.dart';
import 'reset.dart';
import 'tier.dart';
import 'meme.dart';

class Result extends StatefulWidget {
  final int score;
  final int questionNum;
  final Function resetHandler;
  final double rank;

  Result(this.score, this.questionNum, this.resetHandler, this.rank);

  @override
  _ResultState createState() => _ResultState(score, questionNum, resetHandler, rank);
}

// 애니메이션 하나를 추가하기 위해 SingleTickerProviderStateMixin을 구현
class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  final int score;
  final int questionNum;
  final Function resetHandler;
  double rank;

  Animation animation;
  AnimationController animationController;

  _ResultState(this.score, this.questionNum, this.resetHandler, this.rank);

  @override
  void initState() {
    rank = rank * 100000.0;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
    animation = animationController;

    super.initState();
    animateRank();
  }

  void animateRank() {
    setState(() {
      // 초기 값과 결과 값을 정의해준 후,
      animation = Tween<double>(
        begin: 0.0,
        end: rank,
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
      appBar: AppBar(
        title: Text("Total Result"),
      ),
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
                                  Text(
                                    '${animation.value.toStringAsFixed(0)}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF006064),
                                      fontSize: 72,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Rank(),
                      Tier(),
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
