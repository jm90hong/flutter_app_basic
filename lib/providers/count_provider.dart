import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  //data
  int count = 10;

  //함수
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
