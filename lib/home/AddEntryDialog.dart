import 'package:flutter/material.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  _AddEntryDialogState createState() => new _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  int _radioValue = 0;
  bool homework = true;
  Text title = Text("Neuer Eintrag");
  PageController controller = PageController();
  var currentPageValue = 0.0;
  Color colorTest = Colors.orangeAccent.withOpacity(0.0);
  Color colorHomework = Colors.orangeAccent;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
        colorHomework = Colors.orangeAccent.withOpacity(1.0 - currentPageValue);
        colorTest = Colors.orangeAccent.withOpacity(currentPageValue);
      });
    });
    return Scaffold(
        appBar: AppBar(
          title: title,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Speichern",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Card(
                        margin: EdgeInsets.only(
                            bottom: 10.0, top: 5.0, right: 5.0, left: 5.0),
                        color: colorHomework,
                        child: InkWell(
                          onTap: () {
                            _radioValueChange(0);
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 20.0),
                            child: Text("Hausaufgabe"),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(
                          bottom: 10.0, top: 5.0, right: 5.0, left: 5.0),
                      color: colorTest,
                      child: InkWell(
                        onTap: () {
                          _radioValueChange(1);
                        },
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 20.0),
                          child: Text("Prüfung"),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                child: Divider(),
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    Container(child: addHomework()),
                    Container(child: addTest()),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  _radioValueChange(int value) {
    print(value);
    setState(() {
      _radioValue = value;
      if (_radioValue == 0) {
        controller.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      } else {
        controller.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      }
    });
  }
}

class addHomework extends StatefulWidget {
  addHomeworkState createState() => addHomeworkState();
}

class addHomeworkState extends State<addHomework> {
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Center(child: Text("Hausaufgabe")),
    );
  }
}

class addTest extends StatefulWidget {
  addTestState createState() => addTestState();
}

class addTestState extends State<addTest> {
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Center(child: Text("Prüfung")),
    );
  }
}
