import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Column(
        children: [
          TextField(
            decoration: kTextFieldDecocation.copyWith(hintText: 'Email'),
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
            decoration: kTextFieldDecocation.copyWith(hintText: 'Password'),
          ),
          const SizedBox(
            height: 50,
          ),
          LoginButton(
            onPressed: () {},
          )
        ],
      ),
    )));
  }
}
