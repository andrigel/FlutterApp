import 'package:flutter/material.dart';
import 'package:flutter_app/database/database.dart';
import 'package:flutter_app/model/product.dart';

class ProductTile extends StatefulWidget{
  final Product product;
  ProductTile({Key key, @required this.product}): super(key: key);

  @override
  _ProductTile createState() => _ProductTile();
}


class _ProductTile extends State<ProductTile> {
  String _mode = "read";
  String _newFeedback = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    setState(() {
      _mode="read";
    });
    return await showDialog(context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            final _feedbackForRead = widget.product.feedback == '' ?
            Column(
                children: <Widget>[
                  Text("Not yet aviable"),
                  TextButton(onPressed: ()=> setState((){
                    _newFeedback="";
                    _mode="update";
                  }),
                      child: Text("Add feedback"))
                ]
            )
                :
            Column(
              children: [
                Text(widget.product.feedback),
                TextButton(onPressed: ()=> setState((){
                  _newFeedback=widget.product.feedback;
                  _mode="update";
                }),
                    child: Text("Change feedback"))
              ],
            );

            final _feedbackForUpdate = Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _newFeedback,
                    onChanged: (text) =>
                    {
                      setState(() {
                        _newFeedback = text;
                      })
                    }
                      ),
                      TextButton(onPressed: () =>
                          setState(() {
                            final db = DatabaseService();
                            db.updateUserData(widget.product.barCode, widget.product.name, _newFeedback);
                            Navigator.of(context).pop();
                          }),
                          child: Text("Save changes"))
                ]
            );

            return AlertDialog(

              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text("Bar code"),
                            Text(widget.product.barCode),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 25),
                      ),
                      Text("Feedback"),
                      _mode == "read" ? _feedbackForRead :
                          _feedbackForUpdate
                    ],
                  )
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title: Text(widget.product.name),
          subtitle: Text(widget.product.barCode),
          onTap: () async {
            await showInformationDialog(context);
          },
        ),
      ),
    );
  }
}
