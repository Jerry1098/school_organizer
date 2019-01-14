import 'package:school_organizer/backend/stundenplan/Fach.dart';

class Pruefung {
  DateTime pruefungsTermin;
  Fach fach;
  List<String> lehrnstoff;

  Pruefung(this.pruefungsTermin, this.fach, this.lehrnstoff);
}
