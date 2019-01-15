class StundenTag {
  String _tag;
  String _stunden;
  String _raeume;

  StundenTag(this._tag, this._stunden, this._raeume);

  String get raeume => _raeume;

  set raeume(String value) {
    _raeume = value;
  }

  String get stunden => _stunden;

  set stunden(String value) {
    _stunden = value;
  }

  String get tag => _tag;

  set tag(String value) {
    _tag = value;
  }

  String getStunde(int index) {
    return stunden.split(";")[index];
  }

  StundenTag.fromJson(Map<String, dynamic> m) {
    _tag = m["tag"];
    _stunden = m["stunden"];
    _raeume = m["raeume"];
  }

  Map<String, dynamic> toJson() =>
      {"tag": _tag, "stunden": _stunden, "raeume": _raeume};
}
