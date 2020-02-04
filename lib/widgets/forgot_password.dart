import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
            FlatButton(
              onPressed: () async {
                await FirebaseAuth.instance.sendPasswordResetEmail(
                    email: _emailController.text.trim());
                final snacBar = SnackBar(
                  content: Text('Check your email for Password Reset.'),
                );
                Scaffold.of(_formKey.currentContext).showSnackBar(snacBar);
              },
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
