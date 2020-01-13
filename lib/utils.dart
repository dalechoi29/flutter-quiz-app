import 'package:flutter/material.dart';

var mainColor = Color(0xFF006064);
var mainOpacity = Color(0xFF006064).withOpacity(0.45);
var subColor = Color(0xFF00838F);
var backColor = Color(0xFFE0F7FA);

List<Map<String, Object>> buildQuiz(String name, int answer) {
  var output = [
    {'path': 'assets/images/' + name + '_logo1.png', 'score': 0},
    {'path': 'assets/images/' + name + '_logo2.png', 'score': 0},
    {'path': 'assets/images/' + name + '_logo3.png', 'score': 0},
    {'path': 'assets/images/' + name + '_logo4.png', 'score': 0},
  ];

  output[answer-1]['score'] = 1;

  return output;
}
