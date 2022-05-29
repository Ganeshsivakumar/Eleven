// ignore_for_file: unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'borrowerList.dart';
import 'constants.dart';
import 'widgets.dart';
import 'package:provider/provider.dart';
import 'updateNameProvider.dart';

class BorrowerDetails extends StatefulWidget {
  const BorrowerDetails({Key? key}) : super(key: key);

  @override
  State<BorrowerDetails> createState() => _BorrowerDetailsState();
}

late String amountPaid;
late String paidDate;

class _BorrowerDetailsState extends State<BorrowerDetails> {
  final _firestoree = FirebaseFirestore.instance;
  final firestore = FirebaseFirestore.instance;

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
                                  .collection('paymentData')
                                  .add({
                                'amount': amountPaid,
                                'paidDate': paidDate,
                                'name': Provider.of<UpdateNameProvider>(context,
                                        listen: false)
                                    .bname
                              });
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
            body: Center(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('lender')
                    .doc(auth.currentUser!.email)
                    .collection('paymentData')
                    .where('name',
                        isEqualTo: Provider.of<UpdateNameProvider>(context,
                                listen: false)
                            .bname)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Loading'),
                    );
                  }
                  //print(snapshot.data!.docs);
                  return Center(
                      child: Container(
                    child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Ammount')),
                          DataColumn(label: Text('Paid Date'))
                        ],
                        rows: snapshot.data!.docs.map((data) {
                          return DataRow(cells: [
                            DataCell(Text(data['amount'])),
                            DataCell(Text(data['paidDate']))
                          ]);
                        }).toList()),
                  ));
                },
              ),
            )
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
            ));
  }
}

/*
ListView(
                      children: snapshot.data!.docs.map((data) {
                    return ListTile(
                      title: Text(data['amount']),
                    );
                  }).toList());
                  */