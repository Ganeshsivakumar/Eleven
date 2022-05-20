import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/borrowerList.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'widgets.dart';

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
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (Value) {
                  email = Value;
                },
                decoration: kTextFieldDecocation.copyWith(hintText: 'Email'),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (Value) {
                  password = Value;
                },
                decoration: kTextFieldDecocation.copyWith(hintText: 'Password'),
              ),
              const SizedBox(
                height: 50,
              ),
              SignButton(
                onPressed: () async {
                  try {
                    final newLender =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    if (newLender != null) {
                      Get.to(() => BorrowerList());
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
