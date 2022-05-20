// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'borrowerListProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'widgets.dart';
import 'constants.dart';
import 'package:vasoolraj/borrowerListProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BorrowerList extends StatefulWidget {
  const BorrowerList({
    Key? key,
  }) : super(key: key);

  @override
  _BorrowerListState createState() => _BorrowerListState();
}

TextEditingController borrowerNameController = TextEditingController();
final auth = FirebaseAuth.instance;
late int bindex;
late String ndscreenname;

class _BorrowerListState extends State<BorrowerList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLender();
  }

  final _firestore = FirebaseFirestore.instance;
  void getCurrentLender() async {
    try {
      final Lender = await auth.currentUser;
      if (Lender != null) {
        //final uid = _auth.currentUser?.uid;
        //_firestore.collection('lender').add({'Email': Lender.email});
        // print(_auth.currentUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  //final _firestore = FirebaseFirestore.instance;

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
                    kAddbText,
                    TextField(
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
                                setState(() {
                                  //final uid = auth.currentUser?.uid;
                                  _firestore
                                      .collection('lender')
                                      .doc(auth.currentUser?.email)
                                      .collection('borrowers')
                                      .add({
                                    'Name': borrowerNameController.text,
                                  });
                                  Provider.of<BorrowersListProvider>(context,
                                          listen: false)
                                      .addBorrower(borrowerNameController.text);
                                });
                                borrowerNameController.clear();
                                Navigator.pop(context);
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
                body: ListView.builder(
                    itemCount: BorrowersListProvider.borrowerList.length,
                    itemBuilder: ((context, index) {
                      // bindex = index;
                      return BorrowersListProvider.borrowerList[index];
                    })),
              ),
            ));
      }),
    );
  }
}
