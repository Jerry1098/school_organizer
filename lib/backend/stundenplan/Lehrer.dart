class Lehrer {
  String _name;
  String _geschlecht;

  Lehrer(this._name, this._geschlecht);

  Lehrer.fromJson(Map<String, dynamic> m) {
    _name = m["name"];
    _geschlecht = m["geschlecht"];
  }

  String get name => _name;

  String get geschlecht => _geschlecht;

  Map<String, dynamic> toJson() => {"name": _name, "geschlecht": _geschlecht};

  set geschlecht(String value) {
    _geschlecht = value;
  }

  set name(String value) {
    _name = value;
  }
}
