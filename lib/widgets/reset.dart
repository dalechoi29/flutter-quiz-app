import 'package:flutter/material.dart';

import '../utils.dart';

class ResetButton extends StatelessWidget {
  final Function resetHandler;

  ResetButton(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: resetHandler,
      child: Container(
        height: 48,
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          decoration: new BoxDecoration(
            color: subColor,
            borderRadius: new BorderRadius.circular(36.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: 180 * 3.14 / 180,
                child: Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
              ),
              Text(
                'TRY AGAIN',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
