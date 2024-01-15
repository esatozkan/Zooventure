import 'package:flutter/material.dart';

class PageChangeProvider extends ChangeNotifier {
  int page = 0;
  int flagIndex = -1;

  int get getFlagIndex => flagIndex;
  int get getPage => page;

  void setPage(int index) {
    page = index;
    notifyListeners();
  }

  void setFlagIndex(int value) {
    flagIndex = value;
  }
}
