import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class GoogleSigninButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.all(40),
    child: TextButton(
      child: Text(
        "Sign in with Google",
        style: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black87
        ),
      ),
      onPressed: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context,listen: false);
        provider.login();
      },
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.black87,
          spreadRadius: 3,
          offset: Offset.fromDirection(1)
        )
      ]
    ),
  );
}