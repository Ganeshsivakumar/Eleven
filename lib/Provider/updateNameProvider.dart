import 'package:flutter/material.dart';

class UpdateNameProvider extends ChangeNotifier {
  String bname = 'ganesh';
  void update(String data) {
    bname = data;
    notifyListeners();
  }
}
