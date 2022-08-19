import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  DialogBox({
    required this.childwidget,
    required this.boxheight,
    //required this.boxwidth,
  });
  late Widget childwidget;
  late double boxheight;
  //late double boxwidth;

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        alignment: Alignment.center,
        content: Container(
          height: widget.boxheight,
          child: widget.childwidget,
        ));
  }
}
