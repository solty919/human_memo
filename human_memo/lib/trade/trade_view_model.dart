import 'package:flutter/material.dart';
import 'package:human_memo/models/person.dart';

class TradeViewModel with ChangeNotifier {
  static SNS _sns = SNS()
    ..twitter = "@twitterID"
    ..instagram = "instagramID"
    ..faceBook = "faceBook"
    ..youtube = "youtube"
    ..blog = "blog"
    ..tiktok = "tiktok";

  Person person = Person()
    ..mine = true
    ..image =
        null //Image.asset("images/twitter_icon.png", fit: BoxFit.fitWidth)
    ..backImage = Image.asset("images/twitter_icon.png", fit: BoxFit.fitWidth)
    ..name = "きりん"
    ..birthday = DateTime(1994, 9, 19)
    ..job = "Mobile App Engineer"
    ..sns = _sns;
}
