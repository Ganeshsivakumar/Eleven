import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'borrowerListProvider.dart';
import 'borrowerList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(vasoolraj());
}

// ignore: camel_case_types
class vasoolraj extends StatelessWidget {
  const vasoolraj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: ((context, child) {
          return GetMaterialApp(
            home: const Scaffold(body: BorrowerList()),
            routes: {
              'borrowerlistscreenroute': (context) => const BorrowerList()
            },
          );
        }),
        create: (context) => BorrowersListProvider());
  }
}
