// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:vasoolraj/Widgets/splashScreen.dart';
import 'Screens/borrowerList.dart';
import 'package:vasoolraj/Provider/updateNameProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(vasoolraj());
}

// ignore: camel_case_types
class vasoolraj extends StatefulWidget {
  @override
  State<vasoolraj> createState() => _vasoolrajState();
}

class _vasoolrajState extends State<vasoolraj> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (context) => BorrowersListProvider()),
        ChangeNotifierProvider(create: (context) => UpdateNameProvider())
      ],
      child: GetMaterialApp(
        home: const Scaffold(body: SplashScreen()),
        routes: {'borrowerlistscreenroute': (context) => const BorrowerList()},
      ),
    );
  }
}
