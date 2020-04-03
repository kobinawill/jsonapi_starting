import 'package:flutter/material.dart';

void displayAlert (BuildContext context, String message){
  var alert = new AlertDialog(
    title: new Text("My App"),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(
          onPressed: () => Navigator.pop(context),
          child: new Text("OK"))
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}