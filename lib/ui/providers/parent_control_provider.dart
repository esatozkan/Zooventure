import 'dart:math';
import 'package:flutter/material.dart';

class ParentControlProvider with ChangeNotifier {
  int result = 0;
  int firstNumber = 0;
  int secondNumber = 0;

  int get getResult => result;
  int get getFirstNumber => firstNumber;
  int get getSecondNumber => secondNumber;

  void generateProcess() {
    result = Random().nextInt(5) + 1;
    firstNumber = Random().nextInt(5) + 1;

    if (result > firstNumber) {
      secondNumber = result - firstNumber;
    } else {
      int a = result;
      secondNumber = firstNumber - result;
      result = firstNumber;
      firstNumber = a;
    }
  }
}
