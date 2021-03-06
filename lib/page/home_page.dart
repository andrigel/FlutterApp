import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/google_sign_in.dart';
import 'package:flutter_app/widget/goods_widget.dart';
import 'package:flutter_app/widget/sign_in_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/model/product.dart';
import 'file:///C:/Users/1/Desktop/flutter_app/lib/database/database.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamProvider<List<Product>>.value(
      initialData: [],
      value: DatabaseService().goods,
      child :Scaffold(
    body: ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);

          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return GoodsWidget();
          } else {
            return SignInWidget();
          }
        },
      ),
    ),
  ));

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
