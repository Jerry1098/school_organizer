import 'package:school_organizer/backend/hausaufgaben/Hausaufgabe.dart';
import 'package:school_organizer/backend/pruefungen/Pruefung.dart';
import 'package:school_organizer/backend/stundenplan/Fach.dart';
import 'package:school_organizer/backend/stundenplan/Lehrer.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:school_organizer/backend/stundenplan/StundenTag.dart';

class Saves {
  String hausaufgaben_name = "hausaufgaben.json";
  String faecher_name = "faecher.json";
  String lehrer_name = "lehrer.json";
  String pruefungen_name = "pruefungen.json";
  String stundenTag_name = "stundenTage.json";

  List<Hausaufgabe> hausaufgaben = [];
  List<Fach> faecher = [];
  List<Lehrer> lehrer = [];
  List<Pruefung> pruefungen = [];
  List<StundenTag> stundenTage = [];

  Future<bool> readAll() async {
    try {
      if (await readFile(hausaufgaben_name) != null)
        json
            .decode(await readFile(hausaufgaben_name))
            .forEach((map) => hausaufgaben.add(Hausaufgabe.fromJson(map)));

      if (await readFile(faecher_name) != null)
        json
            .decode(await readFile(faecher_name))
            .forEach((map) => faecher.add(Fach.fromJson(map)));

      if (await readFile(lehrer_name) != null)
        json
            .decode(await readFile(lehrer_name))
            .forEach((map) => lehrer.add(Lehrer.fromJson(map)));

      if (await readFile(pruefungen_name) != null)
        json
            .decode(await readFile(pruefungen_name))
            .forEach((map) => pruefungen.add(Pruefung.fromJson(map)));

      if (await readFile(stundenTag_name) != null)
        json
            .decode(await readFile(stundenTag_name))
            .forEach((map) => stundenTage.add(StundenTag.fromJson(map)));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveAll() async {
    try {
      await writeFile(json.encode(hausaufgaben), hausaufgaben_name);
      await writeFile(json.encode(faecher), faecher_name);
      await writeFile(json.encode(lehrer), lehrer_name);
      await writeFile(json.encode(pruefungen), pruefungen_name);
      await writeFile(json.encode(stundenTage), stundenTag_name);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future sleep() {
    return Future.delayed(Duration(seconds: 5));
  }

  Future<String> getContent(String path) async {
    String content = "";
    Directory(path)
        .list(recursive: true, followLinks: false)
        .listen((FileSystemEntity entity) {
      content = (entity.path);
    });
    return content;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String name) async {
    final path = await _localPath;
    return File('$path/$name');
  }

  Future<File> writeFile(String content, String name) async {
    final file = await _localFile(name);
    return file.writeAsString('$content');
  }

  Future<String> readFile(String name) async {
    try {
      final file = await _localFile(name);

      return await file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
