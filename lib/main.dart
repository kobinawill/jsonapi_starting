import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'displayDialog.dart' as display;

void main() async {
  List _data = await getUi();
  runApp(new MaterialApp(
    title: "JSON Parse" ,
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("JSON Parse"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int indexValue){
              return new Column(
                children: <Widget>[
                  new Divider(height: 5.5,),
                  new ListTile(
                    title: new Text(_data[indexValue]['title']),
                    subtitle: new Text(_data[indexValue]['body']),
                    leading: new CircleAvatar(
                      child: new Text("${_data[indexValue]['id']}"),
                      backgroundColor: Colors.brown.shade900,
                    ),
                    onTap: () => display.displayAlert(context, "${_data[indexValue]['body']}"),
                  )
                ],
              );
            }),
      ),
    ),
  ));
}

Future<List> getUi() async {
    http.Response theResponse = await http.get("https://jsonplaceholder.typicode.com/posts");
    return json.decode(theResponse.body);
}

