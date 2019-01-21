import 'package:flutter/material.dart';
import 'package:school_organizer/backend/Saves.dart';
import 'package:intl/intl.dart';

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
  Color colorTest = Colors.white;
  Color colorHomework = Colors.orangeAccent;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
        colorHomework = alphaBlend(
            Colors.orangeAccent.withOpacity(1.0 - currentPageValue),
            Colors.white);
        colorTest = alphaBlend(
            Colors.orangeAccent.withOpacity(currentPageValue), Colors.white);
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
                    Container(
                        child: SingleChildScrollView(
                      child: addHomework(),
                    )),
                    Container(
                      child: SingleChildScrollView(child: addTest()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  static Color alphaBlend(Color foreground, Color background) {
    final int alpha = foreground.alpha;
    if (alpha == 0x00) {
      // Foreground completely transparent.
      return background;
    }
    final int invAlpha = 0xff - alpha;
    int backAlpha = background.alpha;
    if (backAlpha == 0xff) {
      // Opaque background case
      return new Color.fromARGB(
        0xff,
        (alpha * foreground.red + invAlpha * background.red) ~/ 0xff,
        (alpha * foreground.green + invAlpha * background.green) ~/ 0xff,
        (alpha * foreground.blue + invAlpha * background.blue) ~/ 0xff,
      );
    } else {
      // General case
      backAlpha = (backAlpha * invAlpha) ~/ 0xff;
      final int outAlpha = alpha + backAlpha;
      assert(outAlpha != 0x00);
      return new Color.fromARGB(
        outAlpha,
        (foreground.red * alpha + background.red * backAlpha) ~/ outAlpha,
        (foreground.green * alpha + background.green * backAlpha) ~/ outAlpha,
        (foreground.blue * alpha + background.blue * backAlpha) ~/ outAlpha,
      );
    }
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

  static List<DropdownMenuItem<String>> getFaecher() {
    List<String> faecher = [];

    for (int i = 0; i < Saves.faecher.length; i++) {
      faecher.add(Saves.faecher[i].name);
      print(Saves.faecher[i].name);
    }

    return faecher
        .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}

class addHomework extends StatefulWidget {
  addHomeworkState createState() => addHomeworkState();
}

class addHomeworkState extends State<addHomework> {
  String _selectedSubjectHomework;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              isExpanded: true,
              value: _selectedSubjectHomework,
              hint: Text("Wähle ein Fach"),
              onChanged: ((String newValue) {
                setState(() {
                  _selectedSubjectHomework = newValue;
                  print(newValue);
                });
              }),
              items: _AddEntryDialogState.getFaecher(),
            ),
          ),
        ),
      ],
    );
  }
}

class addTest extends StatefulWidget {
  addTestState createState() => addTestState();
}

class addTestState extends State<addTest> {
  String selectedSubjectTest;
  DateTime selectedDate = DateTime.now();
  DateTime firstDate = DateTime(2019);
  DateTime lastDate = DateTime(2100);

  Future<Null> _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDate,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              isExpanded: true,
              value: selectedSubjectTest,
              hint: Text("Wähle ein Fach"),
              onChanged: ((String newValue) {
                setState(() {
                  selectedSubjectTest = newValue;
                  print(newValue);
                });
              }),
              items: _AddEntryDialogState.getFaecher(),
            ),
          ),
        ),
        Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () => _selectDate(context),
                  child:
                      Text("Am: " + DateFormat.yMd("de").format(selectedDate)),
                )))
      ],
    );
  }
}
