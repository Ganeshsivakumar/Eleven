import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eleven/Authentication/authScreen.dart';
import 'package:Eleven/Screens/borrowerList.dart';
import 'package:Eleven/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Eleven/Widgets/widgets.dart';

class RigesterScreen extends StatefulWidget {
  const RigesterScreen({Key? key}) : super(key: key);

  @override
  State<RigesterScreen> createState() => _RigesterScreenState();
}

final _auth = FirebaseAuth.instance;
late String email;
late String password;

class _RigesterScreenState extends State<RigesterScreen> {
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
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecocation.copyWith(hintText: 'Email'),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecocation.copyWith(hintText: 'Password'),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundedRectangleButton(
                  onPressed: () async {
                    try {
                      final newLender =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newLender != null) {
                        Get.to(() => const BorrowerList());
                      }
                    } catch (e) {
                      Get.snackbar('Error', e.toString(),
                          backgroundColor: (Colors.red));
                    }
                  },
                  title: 'Register')
            ],
          ),
        )),
      ),
    );
  }
}
