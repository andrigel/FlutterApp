import 'package:flutter/material.dart';
import 'package:flutter_app/widget/sign_in_widget.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => buildHomePage();

  Widget buildHomePage() => SignInWidget();
}