// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:Eleven/Widgets/splashScreen.dart';
import 'package:Eleven/Provider/updateNameProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(eleven());
}

// ignore: camel_case_types
class eleven extends StatefulWidget {
  @override
  State<eleven> createState() => _elevenState();
}

class _elevenState extends State<eleven> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (context) => BorrowersListProvider()),
        ChangeNotifierProvider(create: (context) => UpdateNameProvider())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Scaffold(body: SplashScreen()),
      ),
    );
  }
}
