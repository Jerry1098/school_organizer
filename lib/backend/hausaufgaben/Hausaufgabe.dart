import 'package:school_organizer/backend/stundenplan/Fach.dart';

class Hausaufgabe {
  String _abgabeTermin;
  String _fach;
  bool _wichtig;
  String _aufgabe;

  Hausaufgabe(this._abgabeTermin, this._fach, this._aufgabe, this._wichtig);

  Hausaufgabe.fromJson(Map<String, dynamic> m) {
    _abgabeTermin = m["abgabeTermin"];
    _fach = m["fach"];
    _aufgabe = m["aufgabe"];
    _wichtig = m["wichtig"];
  }

  String get abgabeTermin => _abgabeTermin;

  String get fach => _fach;

  bool get wichtig => _wichtig;

  String get aufgabe => _aufgabe;

  Map<String, dynamic> toJson() => {
        "abgabeTermin": _abgabeTermin,
        "fach": _fach,
        "aufgabe": _aufgabe,
        "wichtig": _wichtig
      };
}
