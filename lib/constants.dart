import 'package:flutter/material.dart';

const kTextFieldDecocation = InputDecoration(
  focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff8eacbb))),
  hintText: 'Enter a value',
);

const kAddbText = Align(
  alignment: Alignment.centerLeft,
  child: Text(
    'Add New Borrower',
    style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 78, 77, 77),
        fontSize: 20),
  ),
);
const kAddPaymentsDataText = Align(
  alignment: Alignment.centerLeft,
  child: Text(
    'Enter Payment Data',
    style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 78, 77, 77),
        fontSize: 20),
  ),
);

const kNewUserText = Text(
  'New User ?',
  style: TextStyle(fontSize: 20),
);
const kLoginText = Text(
  'Existing User ?',
  style: TextStyle(fontSize: 18),
);
const welcomeText = Text(
  'Hello! Welcome.',
  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
);
