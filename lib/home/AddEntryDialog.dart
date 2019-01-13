import 'package:flutter/material.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  _AddEntryDialogState createState() => new _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Neuer Eintrag"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop("Kleiner Test");
            },
            child: Text("Speichern", style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Text("Body"),
    );
  }
}