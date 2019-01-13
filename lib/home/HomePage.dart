import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key : key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  void _buttonPressed(index){
    Fluttertoast.showToast(msg: "Du hast den Knopf mit dem Index $index gedrückt");
  }

  //das ist ein kleiner Test

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text("SchoolOrganizer"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {_buttonPressed(0);},
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {_buttonPressed(1);},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        notchMargin: 4.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(icon: Icon(Icons.book), onPressed: () {_buttonPressed(2);}),
            IconButton(icon: Icon(Icons.home), onPressed: () {_buttonPressed(3);}),
            Container(width: 35.0, height: 0.0,),
            IconButton(icon: Icon(Icons.school), onPressed: () {_buttonPressed(4);}),
            IconButton(icon: Icon(Icons.settings), onPressed: () {_buttonPressed(5);}),
          ],
        ),
      ),

    );
  }

}