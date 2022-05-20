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

const kEnterMobileNumberText = Text(
  'Hello, Enter your mobile number to get Otp',
  style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 78, 77, 77),
    fontSize: 21,
  ),
);

const kEnterOtpText = Text(
  'Enter the otp sent to your mobile number',
  style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 78, 77, 77),
      fontSize: 15),
);
