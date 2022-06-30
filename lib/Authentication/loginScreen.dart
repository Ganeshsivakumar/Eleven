import 'package:flutter/material.dart';
import 'package:vasoolraj/Authentication/authScreen.dart';
import 'package:vasoolraj/constants.dart';
import 'package:vasoolraj/Widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/Screens/borrowerList.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: NavigationArrow(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.to(() => const AuthScreen());
                  },
                )),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecocation.copyWith(hintText: 'Email'),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecocation.copyWith(hintText: 'Password'),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            RoundedRectangleButton(
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Get.to(() => const BorrowerList());
                    }
                  } catch (e) {
                    Get.snackbar('Error', e.toString(),
                        backgroundColor: (Colors.red));
                  }
                },
                title: 'Login')
          ],
        ),
      )),
    ));
  }
}
