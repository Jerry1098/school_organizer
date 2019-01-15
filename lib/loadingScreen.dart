import 'package:flutter/material.dart';
import 'backend/Saves.dart';

class loadingScreen extends StatefulWidget {
  @override
  _loadingScreenState createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();
    readFiles();
  }

  readFiles() async {
    Saves saves = Saves();
    await saves.readAll();
    navigationPage();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed("/HomePage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "SchoolOrganizer",
          style: TextStyle(fontFamily: "Poppins", fontSize: 30),
        ),
        Container(
          padding: EdgeInsets.all(40),
        ),
        CircularProgressIndicator()
      ],
    ));
  }
}
