import 'package:school_organizer/backend/stundenplan/Fach.dart';

class Hausaufgabe {
  DateTime abgabeTermin;
  Fach fach;
  bool wichtig;
  String aufgabe;

  Hausaufgabe(this.abgabeTermin, this.fach, this.aufgabe, this.wichtig);
}
