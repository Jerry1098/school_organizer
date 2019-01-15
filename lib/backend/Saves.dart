import 'package:school_organizer/backend/hausaufgaben/Hausaufgabe.dart';
import 'package:school_organizer/backend/pruefungen/Pruefung.dart';
import 'package:school_organizer/backend/stundenplan/Fach.dart';
import 'package:school_organizer/backend/stundenplan/Lehrer.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class Saves {
  String hausaufgaben_key = "hausaufgaben_key234423";
  String faecher_key = "faecher_key2445623";
  String lehrer_key = "lehrer_key1234321";
  String pruefungen_key = "pruefungen_key1234532";

  List<Hausaufgabe> hausaufgaben;
  List<Fach> faecher;
  List<Lehrer> lehrer;
  List<Pruefung> pruefungen;

  Future<bool> readAll() async {
    print("Sieht gut aus");
    await sleep();
    return true;
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
      return "0";
    }
  }
}
