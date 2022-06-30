import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/Authentication/authScreen.dart';
import 'package:vasoolraj/Screens/borrowerList.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String loggedinUserEmail;
  late String loggedinUserPassword;
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      //validateUserAuth();
      validateuser();
    });

    super.initState();
  }

  final _firestore = FirebaseFirestore.instance;

  void validateuser() async {
    final loggedinnuser = auth.currentUser;
    if (loggedinnuser == null) {
      Get.to(() => const AuthScreen());
    } else {
      Get.to(() => const BorrowerList());
    }
  }

  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
