import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LogoutWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return TextButton(onPressed: ()
    {
      final provider =
      Provider.of<GoogleSignInProvider>(context, listen: false);
      provider.logout();
    },
        child: Container(
        child: Text("Logout",
          style: TextStyle(
            color: Colors.white,
          )
        ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.lightBlue
          ),
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 50)
        ));
  }
}