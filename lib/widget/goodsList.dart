import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/widget/product_tile.dart';
import 'package:flutter_app/model/product.dart';

class GoodsList extends StatefulWidget {
  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList>{
  @override
  Widget build(BuildContext context) {

    final goods = Provider.of<List<Product>>(context);

    return ListView.builder(
      itemCount: goods.length,
      itemBuilder: (context, index){
        return ProductTile(product: goods[index]);
      },
        );
  }
}