import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  DialogBox({required this.childwidget});
  late Widget childwidget;

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 180,
        child: widget.childwidget,
      ),
    );
  }
}
