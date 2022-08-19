// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

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
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(const Color(0xFF607D8B))),
      onPressed: widget.onPressed,
      child: const Text(
        'Add',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class RoundedRectangleButton extends StatefulWidget {
  RoundedRectangleButton({required this.onPressed, required this.title});
  VoidCallback onPressed;
  String title;

  @override
  State<RoundedRectangleButton> createState() => _RoundedRectangleButtonState();
}

class _RoundedRectangleButtonState extends State<RoundedRectangleButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 6,
              color: Colors.black.withOpacity(0.3),
            ),
          ]),
          width: 150,
          height: 45,
          child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff607d8b))),
            onPressed: widget.onPressed,
            child: Text(
              widget.title,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
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

class ConsentButton extends StatefulWidget {
  ConsentButton({required this.onPressed, required this.buttontext});
  VoidCallback onPressed;
  late String buttontext;

  @override
  State<ConsentButton> createState() => _ConsentButtonState();
}

class _ConsentButtonState extends State<ConsentButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.buttontext,
          style: TextStyle(color: Color(0xff607d8b)),
        ));
    //Text(widget.buttontext));
  }
}
