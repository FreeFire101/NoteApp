import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  var _count = 0;
  int get getCounter {
    return _count;
  }

  incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}
