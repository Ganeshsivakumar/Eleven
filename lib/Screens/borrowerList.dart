// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vasoolraj/Authentication/authScreen.dart';
import 'package:vasoolraj/Authentication/loginScreen.dart';
import 'package:vasoolraj/Provider/borrowerListProvider.dart';
import 'package:vasoolraj/Widgets/widgets.dart';
import 'package:vasoolraj/constants.dart';
import 'package:vasoolraj/Widgets/borrowerCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vasoolraj/Widgets/navDrawer.dart';

class BorrowerList extends StatefulWidget {
  const BorrowerList({
    Key? key,
  }) : super(key: key);

  @override
  _BorrowerListState createState() => _BorrowerListState();
}

TextEditingController borrowerNameController = TextEditingController();
final auth = FirebaseAuth.instance;

class _BorrowerListState extends State<BorrowerList> {
  @override
  final _firestore = FirebaseFirestore.instance;

  static String id = 'borrowerlistscreen';
  final _firestoree = FirebaseFirestore.instance;

  addborrowerdialog(BuildContext context) {
    String? newBorrowerName;
    return showDialog(
        context: context,
        builder: (context) {
          return Builder(builder: (context) {
            return AlertDialog(
              content: Container(
                height: 180,
                child: Column(
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
                              onPressed: () {
                                if (borrowerNameController.text.isEmpty) {
                                  Get.snackbar(
                                      'Error:', "Borrower Name can't be empty",
                                      backgroundColor: Colors.red);
                                } else {
                                  try {
                                    _firestore
                                        .collection('lender')
                                        .doc(auth.currentUser?.email)
                                        .collection('borrowers')
                                        .add({
                                      'Name': borrowerNameController.text,
                                    });
                                    borrowerNameController.clear();
                                    Navigator.pop(context);
                                  } catch (e) {
                                    Get.snackbar('Error', e.toString());
                                  }
                                }
                              },
                            );
                          },
                        ))
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BorrowersListProvider>(
      builder: ((context, BorrowersListProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
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
                        .doc(auth.currentUser!.email)
                        .collection('borrowers')
                        .orderBy('Name', descending: false)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      try {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Color(0xff8eacbb),
                          ));
                        } else if (snapshot.data!.docs.isEmpty) {
                          return Center(
                            child: const Text(
                              'Press  +  to add borrower',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }
                      } catch (e) {
                        Get.snackbar('Error', e.toString());
                      }
                      return ListView(
                          children: snapshot.data!.docs.map((data) {
                        return BorrowerCard(BorrowerName: data['Name']);
                      }).toList());
                    },
                  )),
            ));
      }),
    );
  }
}
