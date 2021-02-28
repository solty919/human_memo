import 'package:flutter/material.dart';
import 'package:human_memo/common/image_path.dart';
import 'package:human_memo/models/person.dart';
import 'package:human_memo/persons/models/search.dart';

class PersonsViewModel with ChangeNotifier {
  Search search = Search();

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

  List<Person> get filtered {
    var _persons = persons.toList();
    if (search.name.isNotEmpty) {
      _persons = _persons
          .where((element) => element.name.contains(search.name))
          .toList();
    }
    //TODO: 誕生月絞り込み
    return _persons;
  }

  void setSearch(Search search) {
    this.search = search;
    notifyListeners();
  }

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
