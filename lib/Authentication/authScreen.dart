import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/constants.dart';
import 'loginScreen.dart';
import 'registerScreen.dart';
import 'package:vasoolraj/Widgets/widgets.dart';

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
            child: Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Column(
                children: [
                  welcomeText,
                  const SizedBox(
                    height: 40,
                  ),
                  kNewUserText,
                  const SizedBox(
                    height: 50,
                  ),
                  AuthButton(
                    onPressed: () {
                      Get.to(() => const RigesterScreen());
                    },
                    title: 'Register',
                  ),
                  const Divider(
                    height: 80,
                    thickness: 4,
                  ),
                  kLoginText,
                  SizedBox(
                    height: 50,
                  ),
                  AuthButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      title: 'Login'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
