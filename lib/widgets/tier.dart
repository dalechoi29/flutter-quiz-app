import 'package:flutter/material.dart';

class Tier extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Tier Bronze',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Image',
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
    );
  } 
}