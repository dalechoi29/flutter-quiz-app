import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String email;

  const MainPage({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HI"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: FlatButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Logout"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
