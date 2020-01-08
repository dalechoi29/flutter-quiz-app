import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final double progressValue;

  Progress(this.progressValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: LinearProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF006064)),
        backgroundColor: Colors.white,
        value: progressValue,
      ),
    );
  }
}
