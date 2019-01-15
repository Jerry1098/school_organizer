import 'package:flutter/material.dart';

import 'Lehrer.dart';

class Fach {
  String _name;
  String _color;
  String _lehrer;

  Fach(this._name, this._lehrer, this._color);

  Fach.fromJson(Map<String, dynamic> m) {
    _name = m["name"];
    _lehrer = m["lehrer"];
    _color = m["color"];
  }

  String get lehrer => _lehrer;

  String get color => _color;

  String get name => _name;

  Map<String, dynamic> toJson() =>
      {"name": _name, "lehrer": _lehrer, "color": _color};
}
