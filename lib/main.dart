import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:vasoolraj/authScreen.dart';
import 'borrowerListProvider.dart';
import 'borrowerList.dart';
import 'package:vasoolraj/updateNameProvider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BorrowersListProvider()),
        ChangeNotifierProvider(create: (context) => UpdateNameProvider())
      ],
      child: GetMaterialApp(
        home: const Scaffold(body: AuthScreen()),
        routes: {'borrowerlistscreenroute': (context) => const BorrowerList()},
      ),
    );
  }
}

/*
GetMaterialApp(
            home: const Scaffold(body: AuthScreen()),
            routes: {
              'borrowerlistscreenroute': (context) => const BorrowerList()
            },
          );
          */
