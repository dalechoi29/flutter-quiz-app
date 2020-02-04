import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/join_or_login.dart';
import 'package:quiz_app/helper/login_background.dart';
import 'package:quiz_app/widgets/forgot_password.dart';
import 'package:quiz_app/widgets/main_page.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size: size,
            painter: LoginBackground(
                isJoin: Provider.of<JoinOrLogin>(context).isJoin),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage,
              Stack(
                children: <Widget>[
                  _inputForm(size),
                  _loginBtn(size),
                ],
              ),
              Container(
                height: size.height * 0.05,
                color: Colors.white,
              ),
              Consumer<JoinOrLogin>(
                builder: (BuildContext context, JoinOrLogin joinOrLogin,
                        Widget child) =>
                    GestureDetector(
                  onTap: () => joinOrLogin.toggle(),
                  child: Text(
                    joinOrLogin.isJoin
                        ? "Already Have an Account? Sign in"
                        : "Don't have an Account? Create one",
                    style: TextStyle(
                        color: joinOrLogin.isJoin ? Colors.red : Colors.blue),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.05,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _register(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text("Please try again later"),
      );
      Scaffold.of(context).showSnackBar(snacBar);
    }
    // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  void _login(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user == null) {
      final snacBar = SnackBar(
        content: Text("Please try again later"),
      );
      Scaffold.of(context).showSnackBar(snacBar);
    }
    // Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 24, right: 24),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://i3.wp.com/i.gifer.com/7pv.gif"),
            ),
          ),
        ),
      );

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            bottom: 32,
            top: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "Email",
                    hoverColor: Colors.blue,
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input correct Email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: "Password",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input correct Password";
                    }
                    return null;
                  },
                ),
                Container(
                  height: 8,
                ),
                Consumer<JoinOrLogin>(
                  builder: (context, value, child) => Opacity(
                      opacity: value.isJoin ? 0 : 1,
                      child: GestureDetector(
                        onTap: value.isJoin
                            ? null
                            : () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword())),
                        child: Text("Forgot Password?"),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginBtn(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
        height: 44,
        child: Consumer(
          builder:
              (BuildContext context, JoinOrLogin joinOrLogin, Widget child) =>
                  RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            color: joinOrLogin.isJoin ? Colors.red : Colors.blue,
            child: Text(
              joinOrLogin.isJoin ? "Join" : "Login",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                joinOrLogin.isJoin ? _register(context) : _login(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
