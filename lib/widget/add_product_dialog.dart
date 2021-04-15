import 'package:flutter/material.dart';
import 'package:flutter_app/database/database.dart';

class DialogWidget extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogWidget> {
   String _productCode = "";
   String _productName = "";
   String _feedback = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            hintText: "Enter product code here"),
                        onChanged: (text) => {
                          setState(() {_productCode = text;})
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Enter product name here"),
                          onChanged: (text) =>
                          {
                            setState(() {
                              _productName = text;
                            })
                          }
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Enter your feedback here"),
                          onChanged: (text) =>
                          {
                            setState(() {
                              _feedback = text;
                            })
                          }
                      ),
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      final db = DatabaseService();
                      db.updateUserData(_productCode,_productName,_feedback);
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
    return  FloatingActionButton.extended(
              onPressed: () async {
                await showInformationDialog(context);
              },
        label: Container(
          child: Text("+",
              style: TextStyle(
                  fontSize: 25
              )
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        )
             );
  }
}