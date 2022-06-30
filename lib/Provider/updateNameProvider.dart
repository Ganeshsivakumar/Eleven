import 'package:flutter/material.dart';

class UpdateNameProvider extends ChangeNotifier {
  String bname = 'Ganesh';
  void update(String data) {
    bname = data;
    notifyListeners();
  }
}
