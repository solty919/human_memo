import 'package:flutter/material.dart';

class Person {
  bool mine = false;

  Image image;
  Image backImage;

  String name;
  DateTime birthday;

  int get age {
    var _age = DateTime.now().year - birthday.year; //今年の年齢
    if (DateTime.now().month < birthday.month) {
      return _age - 1;
    }
    if (DateTime.now().month == birthday.month) {
      if (DateTime.now().day < birthday.day) {
        return _age - 1;
      }
    }
    return _age;
  }

  String job;

  SNS sns;
}

class SNS {
  String twitter;
  String instagram;
  String faceBook;
  String tiktok;
  String youtube;
  String blog;
}
