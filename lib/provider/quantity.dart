import 'package:flutter/widgets.dart';

class Quantity with ChangeNotifier {
  int counter = 0;

  incerment() {
    counter++;
    notifyListeners();
  }

  decrment() {
    if (counter > 0) {
      counter--;
    } else {
      counter;
    }
    notifyListeners();
  }
}
