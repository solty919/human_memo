import 'package:flutter/material.dart';
import 'package:human_memo/models/person.dart';

class PersonsViewModel with ChangeNotifier {
  // List<Person> persons;
  List<Person> persons = [
    Person()
      ..icon = Image.network(
          "https://dol.ismcdn.jp/mwimgs/5/4/670m/img_54dc9908d97e64c3a647db92ffc43f25690600.jpg")
      ..address = "草原"
      ..name = "うさぎさん",
    Person()
      ..icon = Image.network(
          "https://cdn-natgeo.nikkeibp.co.jp/atcl/news/16/c/100400101/ph_thumb.jpg?__scale=w:500,h:333&_sh=0fb0ed06b0")
      ..address = "サバンナ"
      ..name = "きりんさん",
    Person()
      ..icon = Image.network(
          "https://prtimes.jp/i/38159/11/origin/d38159-11-669551-1.jpg")
      ..address = "温泉"
      ..name = "カピバラ",
    Person()
      ..icon =
          Image.network("https://www.i-sedai.com/pet/column/image/C0108_1.jpg")
      ..address = "タワー"
      ..name = "ねこ",
  ];
}
