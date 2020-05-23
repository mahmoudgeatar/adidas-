import 'package:flutter/widgets.dart';

class chooseSize with ChangeNotifier {
  int currentSizeIndex = 0;

  chooseC(index) {
    currentSizeIndex = index;
    notifyListeners();
  }
}
