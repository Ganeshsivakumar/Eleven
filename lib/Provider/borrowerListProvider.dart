import 'package:vasoolraj/Widgets/borrowerCard.dart';
import 'package:flutter/material.dart';

class BorrowersListProvider extends ChangeNotifier {
  List<Widget> borrowerList = [];

  addBorrower(String newBorrowerName) {
    borrowerList.insert(0, BorrowerCard(BorrowerName: newBorrowerName));
    notifyListeners();
  }
}
