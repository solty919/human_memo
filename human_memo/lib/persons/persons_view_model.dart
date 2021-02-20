import 'package:flutter/material.dart';
import 'package:human_memo/common/image_path.dart';
import 'package:human_memo/models/person.dart';

class PersonsViewModel with ChangeNotifier {
  // List<Person> persons;
  List<Person> persons = List.filled(
      100,
      Person()
        ..mine = true
        ..image = Image.asset(ImagePath.twitter, fit: BoxFit.fitWidth)
        ..backImage = Image.asset(ImagePath.twitter, fit: BoxFit.fitWidth)
        ..name = "きりん"
        ..birthday = DateTime(1994, 9, 19)
        ..job = "Mobile App Engineer"
        ..sns = SNS());
}
