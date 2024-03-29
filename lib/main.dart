import 'package:flutter/material.dart';
import 'loadingScreen.dart';
import 'package:school_organizer/home/HomePage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SchoolOrganizer',
      theme: themeData,
      home: loadingScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => HomePage()
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('de', 'DE'),
      ],
    );
  }

  ThemeData themeData = ThemeData(
      primaryColor: Colors.blueGrey,
      accentColor: Colors.orangeAccent,
      fontFamily: "Poppins");
}
