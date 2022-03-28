import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vasoolraj/widgets.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BorrowerList extends StatefulWidget {
  const BorrowerList({
    Key? key,
  }) : super(key: key);

  @override
  _BorrowerListState createState() => _BorrowerListState();
}

final borrowerNameController = TextEditingController();
String value = "";
//Borrowers list
List<Widget> borrowerList = [];
//Creating addBorrowerNameStream to display after onTap card widget
StreamController addBorrowerNameStream = StreamController.broadcast();

class _BorrowerListState extends State<BorrowerList> {
  final _firestore = FirebaseFirestore.instance;

  void addBorrowerToList() {
    setState(() {
      borrowerList.insert(0, borrowerCard());
    });
  }

  //addBStream() {
  //addBorrowerNameStream.sink.add(borrowerNameController.text);
  //}

  @override
  Widget build(BuildContext context) {
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
              //GestureDetector(child: const Icon(Icons.add), onTap: null),
              toolbarHeight: 70,
              backgroundColor: const Color(0xff8eacbb),
              centerTitle: false,
              title: const Text('Borrowers List'),
            ),
            body: ListView.builder(
                itemCount: borrowerList.length,
                itemBuilder: ((context, index) {
                  return borrowerList[index];
                })),
          ),
        ));
  }

  //dialog box with textfields to get borrowername from user
  addborrowerdialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kAddbText,
                TextField(
                  autofocus: true,
                  decoration:
                      kTextFieldDecocation.copyWith(hintText: 'Borrower Name'),
                  controller: borrowerNameController,
                  onChanged: (text) {
                    value = text;
                    addBorrowerNameStream.sink.add(text);
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SaveButton(
                    onPressed: () {
                      addBorrowerNameStream.add(borrowerNameController.text);

                      //accesing stream and printing it.
                      /* Stream stream = addBorrowerNameStream.stream;
                      stream.listen((event) {
                        print("$event");
                      });
                        */
                      //stores borrower name in firebase cloud
                      _firestore
                          .collection('borrowerDetails')
                          .add({'borrowerName': borrowerNameController.text});
                      addBorrowerToList();
                      borrowerNameController.clear();
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ));
        });
  }
}

//Stream stream = addBorrowerNameStream.stream;
