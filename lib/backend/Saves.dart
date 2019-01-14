import 'package:school_organizer/backend/hausaufgaben/Hausaufgabe.dart';
import 'package:school_organizer/backend/pruefungen/Pruefung.dart';
import 'package:school_organizer/backend/stundenplan/Fach.dart';
import 'package:school_organizer/backend/stundenplan/Lehrer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Saves {
  String hausaufgaben_key = "hausaufgaben_key234423";
  String faecher_key = "faecher_key2445623";
  String lehrer_key = "lehrer_key1234321";
  String pruefungen_key = "pruefungen_key1234532";

  List<Hausaufgabe> hausaufgaben;
  List<Fach> faecher;
  List<Lehrer> lehrer;
  List<Pruefung> pruefungen;

  SharedPreferences prefs;
}
