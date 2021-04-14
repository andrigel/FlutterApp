import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/LogoutWidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/provider/database.dart';
import 'package:flutter_app/widget/goodsList.dart';
import 'file:///C:/Users/1/Desktop/flutter_app/lib/model/product.dart';

class GoodsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GoodsList();
  }
}