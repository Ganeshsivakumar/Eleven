// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Eleven/Widgets/widgets.dart';
import 'package:Eleven/constants.dart';
import 'package:Eleven/Widgets/borrowerCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Eleven/Widgets/navDrawer.dart';
import 'package:Eleven/Widgets/dialogbox.dart';

class BorrowerList extends StatefulWidget {
  const BorrowerList({
    Key? key,
  }) : super(key: key);

  @override
  _BorrowerListState createState() => _BorrowerListState();
}

TextEditingController borrowerNameController = TextEditingController();
final auth = FirebaseAuth.instance;
final deleteborrowerinstance = FirebaseFirestore.instance;

class _BorrowerListState extends State<BorrowerList> {
  @override
  final _firestore = FirebaseFirestore.instance;

  static String id = 'borrowerlistscreen';
  final _firestoree = FirebaseFirestore.instance;
  final _firestorem = FirebaseFirestore.instance;
  final _fireestoree = FirebaseFirestore.instance;
  // bool isThere = false;

  /*checkBorrowerAlreadyExists(String textfieldname) async {
    await for (var snapshots in _firestorem
        .collection('lender')
        .doc(auth.currentUser?.uid)
        .collection('borrowers')
        .snapshots()) {
      for (var message in snapshots.docs) {
        bool isThere;
        if (message.data().containsValue(textfieldname)) {
          return isThere = true;
        } else {
          return isThere = false;
        }
      }
    }
  }
  */

  //dialog box to get input ['Borrower Name'] from user.
  addborrowerdialog(BuildContext context) {
    String? newBorrowerName;
    return showDialog(
        context: context,
        builder: (context) {
          return Builder(builder: (context) {
            return DialogBox(
              // boxwidth: 300,
              boxheight: 180,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      kAddbText,
                      Padding(
                        padding: const EdgeInsets.only(left: 40, bottom: 30),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 33,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),
                      FilteringTextInputFormatter.deny(RegExp('[0-9]')),
                      LengthLimitingTextInputFormatter(20)
                    ],
                    controller: borrowerNameController,
                    decoration: kTextFieldDecocation.copyWith(
                        hintText: 'Borrower Name'),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Builder(
                        builder: (context) {
                          return SaveButton(
                            onPressed: () async {
                              if (borrowerNameController.text.isEmpty) {
                                Get.snackbar(
                                    'Error:', "Borrower Name can't be empty",
                                    backgroundColor: Colors.red);
                              } /*else if (await checkBorrowerAlreadyExists(
                                    borrowerNameController.text)) {
                                  Get.snackbar('Error',
                                      'Borrower Name alread exists, Enter new name',
                                      backgroundColor: Colors.red);
                                } */
                              else {
                                try {
                                  _firestore
                                      .collection('lender')
                                      .doc(auth.currentUser?.uid)
                                      .collection('borrowers')
                                      .add({
                                    'Name': borrowerNameController.text,
                                  });
                                } catch (e) {
                                  Get.snackbar('Error', e.toString());
                                }
                                borrowerNameController.clear();
                                Navigator.pop(context);
                              }
                            },
                          );
                        },
                      ))
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, BorrowersListProvider, child) {
        return MaterialApp(
            home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Get.to(() => NavDrawer());
                  },
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        addborrowerdialog(context);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
                toolbarHeight: 70,
                backgroundColor: const Color(0xff8eacbb),
                centerTitle: false,
                title: const Text('Borrowers List'),
              ),
              body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('lender')
                    .doc(auth.currentUser!.uid)
                    .collection('borrowers')
                    .orderBy('Name', descending: false)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  try {
                    if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                              // backgroundColor: Color(0xff607d8b),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff8eacbb))));
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: const Text(
                          'Press  +  to add borrower',
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    } /*else if (snapshot.hasError) {
                      Get.snackbar('Error',
                          "Check internet connection and try again later");
                    }*/
                  } catch (e) {
                    Get.snackbar('Error', e.toString());
                  }
                  return Scrollbar(
                    thickness: 7.0,
                    radius: Radius.circular(10),
                    child: ListView(
                        children: snapshot.data!.docs.map((data) {
                      return BorrowerCard(BorrowerName: data['Name']);
                    }).toList()),
                  );
                },
              )),
        ));
      }),
    );
  }
}



/*
Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        kAddbText,
                        Padding(
                          padding: const EdgeInsets.only(left: 40, bottom: 30),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 33,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      textCapitalization: TextCapitalization.words,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),
                        FilteringTextInputFormatter.deny(RegExp('[0-9]')),
                        LengthLimitingTextInputFormatter(20)
                      ],
                      controller: borrowerNameController,
                      decoration: kTextFieldDecocation.copyWith(
                          hintText: 'Borrower Name'),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Builder(
                          builder: (context) {
                            return SaveButton(
                              onPressed: () async {
                                if (borrowerNameController.text.isEmpty) {
                                  Get.snackbar(
                                      'Error:', "Borrower Name can't be empty",
                                      backgroundColor: Colors.red);
                                } /*else if (await checkBorrowerAlreadyExists(
                                    borrowerNameController.text)) {
                                  Get.snackbar('Error',
                                      'Borrower Name alread exists, Enter new name',
                                      backgroundColor: Colors.red);
                                } */
                                else {
                                  try {
                                    _firestore
                                        .collection('lender')
                                        .doc(auth.currentUser?.uid)
                                        .collection('borrowers')
                                        .add({
                                      'Name': borrowerNameController.text,
                                    });
                                  } catch (e) {
                                    Get.snackbar('Error', e.toString());
                                  }
                                  borrowerNameController.clear();
                                  Navigator.pop(context);
                                }
                              },
                            );
                          },
                        ))
                  ],
                ),
                */


/*
 addborrowerdialog(BuildContext context) {
    String? newBorrowerName;
    return showDialog(
        context: context,
        builder: (context) {
          return Builder(builder: (context) {
            return AlertDialog(
              content: Container(
                height: 180,
                child: 
              ),
            );
          });
        });
  }
  */