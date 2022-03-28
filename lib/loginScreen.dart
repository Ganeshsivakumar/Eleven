import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'borrowerList.dart';
import 'constants.dart';
import 'widgets.dart';

enum MobileVerificationState {
  SHOW_MOBILENUMBER_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILENUMBER_FORM_STATE;

  final phonenumberController = TextEditingController();
  final otpController = TextEditingController();
  late String verificationId;
  bool showLoading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential = _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });

      Get.to(() => const BorrowerList());
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  getMobileNumberWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kEnterMobileNumberText,
        KLoginFormButtonSizedBox,
        TextField(
          controller: phonenumberController,
          decoration: kTextFieldDecocation.copyWith(hintText: 'Mobile Number'),
          onChanged: (value) {},
        ),
        KLoginFormButtonSizedBox,
        LoginFormButton(
            buttontext: const Text(
              'Get Otp',
              style: kLoginFormButtonTextStyle,
            ),
            onPressed: () async {
              setState(() {
                showLoading = true;
              });
              await _auth.verifyPhoneNumber(
                phoneNumber: phonenumberController.text,
                verificationCompleted: (PhoneAuthCredential) async {
                  setState(() {
                    showLoading = false;
                  });
                  //signInWithPhoneAuthCredential(phoneAuthCredential);
                },
                verificationFailed: (PhoneVerificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text(PhoneVerificationFailed.message.toString())));
                },
                codeSent: (verficationId, resendingToken) async {
                  setState(() {
                    showLoading = false;
                    setState(() {
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORM_STATE;
                      this.verificationId = verificationId;
                    });
                  });
                },
                codeAutoRetrievalTimeout: (verficationId) async {},
              );
            })
      ],
    );
  }

  getOtpWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kEnterOtpText,
        KLoginFormButtonSizedBox,
        TextField(
          controller: otpController,
          decoration: kTextFieldDecocation.copyWith(hintText: 'Mobile Number'),
          onChanged: (value) {},
        ),
        KLoginFormButtonSizedBox,
        LoginFormButton(
          buttontext: const Text(
            'Verify Otp',
            style: kLoginFormButtonTextStyle,
          ),
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: showLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : currentState ==
                        MobileVerificationState.SHOW_MOBILENUMBER_FORM_STATE
                    ? getMobileNumberWidget()
                    : getOtpWidget()));
  }
}
