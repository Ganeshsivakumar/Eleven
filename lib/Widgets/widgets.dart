import 'package:flutter/material.dart';

class LoginFormButton extends StatelessWidget {
  LoginFormButton({required this.buttontext, required this.onPressed});

  final buttontext;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff607d8b))),
        child: SizedBox(
          width: 100,
          height: 40,
          child: Align(
            alignment: Alignment.center,
            child: buttontext,
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatefulWidget {
  SaveButton({required this.onPressed});

  VoidCallback onPressed;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff607d8b))),
      onPressed: widget.onPressed,
      child: const Text(
        'Save',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class AuthButton extends StatefulWidget {
  AuthButton({required this.onPressed, required this.title});
  VoidCallback onPressed;
  String title;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 45,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff607d8b))),
          onPressed: widget.onPressed,
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}

class LoginButton extends StatefulWidget {
  LoginButton({required this.onPressed});
  VoidCallback onPressed;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: TextButton(
          child: const Text('Login'),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff607d8b))),
          onPressed: widget.onPressed,
        ));
  }
}

class SignButton extends StatefulWidget {
  SignButton({required this.onPressed});
  VoidCallback onPressed;

  @override
  State<SignButton> createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: TextButton(
          child: const Text('Sign In'),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff607d8b))),
          onPressed: widget.onPressed,
        ));
  }
}

class NavigationArrow extends StatefulWidget {
  NavigationArrow({required this.icon, required this.onPressed});
  Widget icon;
  VoidCallback onPressed;

  @override
  State<NavigationArrow> createState() => _NavigationArrowState();
}

class _NavigationArrowState extends State<NavigationArrow> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      icon: widget.icon,
      iconSize: 30,
    );
  }
}
