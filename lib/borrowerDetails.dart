import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'borrowerList.dart';
import 'constants.dart';
import 'widgets.dart';
import 'borrowerCard.dart';
import 'package:provider/provider.dart';
import 'updateNameProvider.dart';

class BorrowerDetails extends StatefulWidget {
  const BorrowerDetails({Key? key}) : super(key: key);

  @override
  State<BorrowerDetails> createState() => _BorrowerDetailsState();
}

class amountPaidClass {
  String amount;
  String date;
  amountPaidClass({required this.amount, required this.date});
}

var amountpaid = <amountPaidClass>[];
late String amountPaid;
late String paidDate;

class _BorrowerDetailsState extends State<BorrowerDetails> {
  /*addamountpaidtolist() {
    setState(() {
      amountpaid.add(amountPaidClass(
          amount: amountPaidController.text, date: paidDateController.text));
    });
  }
  */
  late String amount;

  final _firestoree = FirebaseFirestore.instance;
  final _firestore = FirebaseFirestore.instance;
  addpaymentsdatadialog(BuildContext context) {
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
                    kAddPaymentsDataText,
                    TextField(
                      onChanged: ((value) {
                        amountPaid = value;
                      }),
                      decoration: kTextFieldDecocation.copyWith(
                          hintText: 'Amount Paid'),
                    ),
                    TextField(
                      onChanged: (value) {
                        paidDate = value;
                      },
                      decoration:
                          kTextFieldDecocation.copyWith(hintText: 'Paid Date'),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Builder(
                          builder: (context) {
                            return SaveButton(onPressed: () {
                              _firestoree
                                  .collection('lender')
                                  .doc(auth.currentUser?.email)
                                  .collection('paymnet data')
                                  .add({
                                'amount': amountPaid,
                                'paid date': paidDate,
                                'name': Provider.of<UpdateNameProvider>(context,
                                        listen: false)
                                    .bname
                              });

                              //addamountpaidtolist();
                              Navigator.pop(context);
                            });
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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    addpaymentsdatadialog(context);
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
            toolbarHeight: 70,
            backgroundColor: const Color(0xff8eacbb),
            centerTitle: false,
            title: Text(
              Provider.of<UpdateNameProvider>(context).bname,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          body: Container()
          /* Center(
            child: Container(
              child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Ammount')),
                    DataColumn(label: Text('Paid Date'))
                  ],
                  rows: amountpaid
                      .map<DataRow>(((amountPaidClass) => DataRow(cells: [
                            DataCell(Text(amountPaidClass.amount)),
                            DataCell(Text(amountPaidClass.date)),
                          ])))
                      .toList()),
                      
            ),
          )*/
          ),
    );
  }
}
