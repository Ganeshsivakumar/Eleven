import 'borrowerCard.dart';
import 'package:flutter/material.dart';

class BorrowersListProvider extends ChangeNotifier {
  List<Widget> borrowerList = [];

  addBorrower(String newBorrowerName) {
    borrowerList.insert(0, borrowerCard(newBorrowerName));
    notifyListeners();
  }
}
