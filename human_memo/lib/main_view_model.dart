import 'package:flutter/material.dart';
import 'package:human_memo/persons/models/search.dart';

class MainViewModel with ChangeNotifier {
  Search search = Search();

  void setSearch(Search search) {
    this.search = search;
    notifyListeners();
  }
}
