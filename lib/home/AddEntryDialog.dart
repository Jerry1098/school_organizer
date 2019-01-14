import 'package:flutter/material.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  _AddEntryDialogState createState() => new _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  int _radioValue = 0;
  bool homework = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neuer Eintrag"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop("Kleiner Test");
            },
            child: Text(
              "Speichern",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RadioListTile(
                  groupValue: _radioValue,
                  onChanged: _radioValueChange,
                  value: 0,
                  title: Text("Hausaufgabe"),
                ),
                RadioListTile(
                  groupValue: _radioValue,
                  onChanged: _radioValueChange,
                  value: 1,
                  title: Text("Prüfung"),
                ),
              ],
            ),
            Container(
              child: Divider(),
              padding: EdgeInsets.symmetric(horizontal: 40.0),
            ),
            homework ? Homework() : Test()
          ],
        ),
      ),
    );
  }

  _radioValueChange(int value) {
    setState(() {
      _radioValue = value;
      if (_radioValue == 0) {
        homework = true;
      } else {
        homework = false;
      }
    });
  }
}

class Homework extends StatefulWidget {
  _HomeworkState createState() => _HomeworkState();
}

class _HomeworkState extends State<Homework> {
  @override
  Widget build(BuildContext context) {
    return Text("Hausaufgabe");
  }
}

class Test extends StatefulWidget {
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Text("Prüfung");
  }
}
