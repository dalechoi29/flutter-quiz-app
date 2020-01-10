import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../const.dart';

class Progress extends StatelessWidget {
  final double progressValue;

  Progress(this.progressValue);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 10,
      progressColor: mainColor,
      backgroundColor: Colors.white,
      percent: progressValue,
    );
  }
}
