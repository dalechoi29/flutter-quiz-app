import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/join_or_login.dart';
import 'package:quiz_app/widgets/main_page.dart';

import 'widgets/quiz.dart';
import 'widgets/auth_page.dart';
import 'utils.dart';

void main() => runApp(MyApp());

//  나는 최대일 바보죠.
// 메인 앱은 항상 MaterialApp 혹은 CupertinoApp을 지녀야 함
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:
            defaultTargetPlatform == TargetPlatform.android ? mainColor : null,
      ),
      title: 'Quiz Application',
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return ChangeNotifierProvider<JoinOrLogin>.value(
              value: JoinOrLogin(),
              child: AuthPage(),
            );
          } else {
            return Intro(
              user: snapshot.data,
            );
          }
        });
  }
}

class Intro extends StatelessWidget {
  final FirebaseUser user;
  const Intro({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Outstanding AI',
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                'One logo is real, the other three are AI made.\nPick the one made by human',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
              ),
              Image.asset('assets/images/intro.png'),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage(user: user,)),
                  );
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: new Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      color: subColor,
                      borderRadius: new BorderRadius.circular(36.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Let\'s Start'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
