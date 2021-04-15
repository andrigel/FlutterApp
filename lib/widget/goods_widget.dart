import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/logoutWidget.dart';
import 'package:flutter_app/widget/add_product_dialog.dart';
import 'package:flutter_app/widget/goodsList.dart';

class GoodsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: LogoutWidget(), titleSpacing: 0),
        floatingActionButton: DialogWidget(),
        body: GoodsList(),
      ));
  }
}