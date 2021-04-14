import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title: Text(product.name),
          subtitle: Text(product.code),
        ),
      ),
    );
  }
}
