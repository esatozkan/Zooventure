import 'package:flutter/material.dart';

class PageChangeProvider extends ChangeNotifier {
  int page = 0;

  int get getPage => page;

  void setPage(int index) {
    page = index;
    notifyListeners();
  }
}
