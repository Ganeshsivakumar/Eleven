import 'package:flutter/material.dart';
import 'package:vasoolraj/borrowerList.dart';

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

const kLoginFormButtonTextStyle = TextStyle(fontSize: 16, color: Colors.white);
const KLoginFormButtonSizedBox = SizedBox(
  height: 20,
);

Container kBorrowerCardProperties() {
  return Container(
    child: Align(
      child: Container(
        width: 355,
        height: 63,
        decoration: ShapeDecoration(
            color: null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Card(
            elevation: 5,
            color: const Color(0xfff5f5f5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  borrowerNameController.text,
                  style: const TextStyle(fontSize: 20),
                ),
                const Icon(Icons.arrow_forward)
              ],
            )),

        //elevation: 5,
        //Icon(Icons.arrow_forward)
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // margin: EdgeInsets.only(top: 15),
      ),
    ),
  );
}
