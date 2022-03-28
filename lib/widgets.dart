import 'package:flutter/material.dart';
import 'package:vasoolraj/borrowerDetails.dart';
import 'constants.dart';
import 'package:get/get.dart';

//enum cancelStream { UNSUBSCRIBE_STATE, SUBSCIBE_STATE }

borrowerCard() {
  //cancelStream currentState = cancelStream.SUBSCIBE_STATE;
  return GestureDetector(
      child: kBorrowerCardProperties(),
      onTap: () {
        Get.to(() => Bname());
      });
}

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
        child: SizedBox(
          width: 100,
          height: 40,
          child: Align(
            alignment: Alignment.center,
            child: buttontext,
          ),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff607d8b))),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  SaveButton({required this.onPressed});

  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        'Save',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xff607d8b))),
      onPressed: onPressed,
    );
  }
}



/*
 addborrowerfab(context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff8eacbb),
      onPressed: () {
       
        addBorrowerToList();
      },
      child: const Icon(Icons.add),
    );
    //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  }

*/








