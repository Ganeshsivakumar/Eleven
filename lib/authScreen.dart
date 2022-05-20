import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/borrowerList.dart';
import 'package:vasoolraj/constants.dart';
import 'package:vasoolraj/loginScreen.dart';
import 'package:vasoolraj/registerScreen.dart';
import 'widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                SignButton(onPressed: () {
                  Get.to(() => RigesterScreen());
                }),
                const SizedBox(
                  height: 60,
                ),
                LoginButton(onPressed: () {
                  Get.to(() => LoginScreen());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
