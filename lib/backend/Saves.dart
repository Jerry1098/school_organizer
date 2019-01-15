import 'package:school_organizer/backend/hausaufgaben/Hausaufgabe.dart';
import 'package:school_organizer/backend/pruefungen/Pruefung.dart';
import 'package:school_organizer/backend/stundenplan/Fach.dart';
import 'package:school_organizer/backend/stundenplan/Lehrer.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

class Saves {
  String hausaufgaben_name = "hausaufgaben.json";
  String faecher_name = "faecher.json";
  String lehrer_name = "lehrer.json";
  String pruefungen_name = "pruefungen.json";

  List<Hausaufgabe> hausaufgaben = [];
  List<Fach> faecher = [];
  List<Lehrer> lehrer = [];
  List<Pruefung> pruefungen = [];

  Future<bool> readAll() async {
    json
        .decode(await readFile(hausaufgaben_name))
        .forEach((map) => hausaufgaben.add(Hausaufgabe.fromJson(map)));
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
