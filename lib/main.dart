import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'borrowerList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const vasoolraj());
}

// ignore: camel_case_types
class vasoolraj extends StatelessWidget {
  const vasoolraj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: Scaffold(body: BorrowerList()));
  }
}
