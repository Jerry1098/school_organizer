class Pruefung {
  String _pruefungsTermin;
  String _fach;
  String _lehrnstoff;

  Pruefung(this._pruefungsTermin, this._fach, this._lehrnstoff);

  Pruefung.fromJson(Map<String, dynamic> m) {
    _pruefungsTermin = m["termin"];
    _fach = m["fach"];
    _lehrnstoff = m["lehrnstoff"];
  }

  String get lehrnstoff => _lehrnstoff;

  String get fach => _fach;

  String get pruefungsTermin => _pruefungsTermin;

  Map<String, dynamic> toJson() => {
        "termin": _pruefungsTermin,
        "fach": _fach,
        "lehrnstoff": _lehrnstoff,
      };

  set lehrnstoff(String value) {
    _lehrnstoff = value;
  }

  set fach(String value) {
    _fach = value;
  }

  set pruefungsTermin(String value) {
    _pruefungsTermin = value;
  }
}
