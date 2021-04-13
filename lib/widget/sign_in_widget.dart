import 'package:flutter/material.dart';
import 'package:flutter_app/widget/Goodle_signin_button.dart';

class SignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => buildSignIn();

  Widget buildSignIn() => Column(
    children: [
      Spacer(),
      Align(
      child: Text("Sign in",
        style: TextStyle(
        color: Colors.black87,
          fontSize: 30,
        ),
      ),
        alignment: Alignment.center,
      ),
      GoogleSigninButtonWidget(),
      Spacer()

    ],
  );
}