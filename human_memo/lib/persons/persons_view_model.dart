import 'package:flutter/material.dart';
import 'package:human_memo/common/image_path.dart';
import 'package:human_memo/models/person.dart';

class PersonsViewModel with ChangeNotifier {
  List<Person> persons = List.generate(
      3,
      (index) => Person()
        ..mine = true
        ..image = Image.asset(ImagePath.twitter, fit: BoxFit.fitWidth)
        ..backImage = Image.asset(ImagePath.twitter, fit: BoxFit.fitWidth)
        ..name = "きりん$index"
        ..birthday = DateTime(1994, 9, 19)
        ..job = "Mobile App Engineer"
        ..sns = SNS());

  void addPerson() {
    persons.add(Person()
      ..mine = true
      ..image = Image.asset(ImagePath.twitter, fit: BoxFit.fitWidth)
      ..backImage = Image.asset(ImagePath.twitter, fit: BoxFit.fitWidth)
      ..name = "test"
      ..birthday = DateTime(1994, 9, 19)
      ..job = "Mobile App Engineer"
      ..sns = SNS());
    notifyListeners();
  }
}
