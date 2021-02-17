import 'package:flutter/material.dart';
import 'package:human_memo/models/person.dart';

class ProfileViewModel with ChangeNotifier {
  bool isEdit = false;

  Person person = Person()
    ..mine = true
    ..image = null
    ..backImage = Image.asset("images/twitter_icon.png", fit: BoxFit.fitWidth)
    ..name = "きりんさん"
    ..birthday = DateTime(1994, 9, 19)
    ..job = "Mobile App Engineer"
    ..sns = SNS();

  void setEdit(bool isEdit) {
    this.isEdit = isEdit;
    notifyListeners();
  }

  void setMine(bool mine) {
    this.person.mine = mine;
    notifyListeners();
  }

  void setImage(Image image) {
    this.person.image = image;
    notifyListeners();
  }

  void setBackImage(Image backImage) {
    this.person.backImage = backImage;
    notifyListeners();
  }

  void setName(String name) {
    this.person.name = name;
    notifyListeners();
  }

  void setBirthday(DateTime dateTime) {
    this.person.birthday = dateTime;
    notifyListeners();
  }

  void setSNS(SNS sns) {
    this.person.sns = sns;
    notifyListeners();
  }
}
