import 'package:flutter/material.dart';

class CheckboxModel extends ChangeNotifier {
int selectedIndex=1;

  void toggleCheckbox(int value) {
   selectedIndex=value;
    notifyListeners();
  }

}
