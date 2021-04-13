import 'package:flutter/material.dart';
import 'package:flutter_app/provider/google_sign_in.dart';
import 'package:flutter_app/widget/sign_in_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => buildHomePage();

  Widget buildHomePage() => Scaffold(
    body: ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: SignInWidget()
    )
  );
}