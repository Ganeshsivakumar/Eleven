import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Eleven/Screens/addPaymentsData.dart';
import 'package:Eleven/Screens/borrowerList.dart';
import 'package:provider/provider.dart';
import 'package:Eleven/Provider/updateNameProvider.dart';
import 'package:get/get.dart';

class BorrowerDetails extends StatefulWidget {
  const BorrowerDetails({Key? key}) : super(key: key);

  @override
  State<BorrowerDetails> createState() => _BorrowerDetailsState();
}

class _BorrowerDetailsState extends State<BorrowerDetails> {
  final firestore = FirebaseFirestore.instance;
  late String datetostring;
  late DateTime stringtodate;

  String formatPaidDate(Timestamp pdTimeStamp) {
    DateTime date = DateTime.parse(pdTimeStamp.toDate().toString());
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.to(() => const BorrowerList());
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Get.to(() => const AddpaymentsData());
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
                        .doc(auth.currentUser!.uid)
                        .collection('paymentData')
                        .where('name',
                            isEqualTo: Provider.of<UpdateNameProvider>(context,
                                    listen: false)
                                .bname)
                        .orderBy('paidDate', descending: true)
                        .snapshots(),

                    //.snapshots(),

                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      /* if (snapshot.hasError) {
                        Get.snackbar('Error',
                            "Check internet connection and try again later");
                      }*/
                      if (!snapshot.hasData) {
                        return const Center(
                            child: CircularProgressIndicator(
                                //backgroundColor: Color(0xff607d8b),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xff8eacbb))));
                      } else if (snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text(
                            'Press  +  to add data',
                            style: TextStyle(fontSize: 22),
                          ),
                        );
                      } else {
                        return Scrollbar(
                          thickness: 7.0,
                          radius: Radius.circular(10),
                          child: Center(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              child: DataTable(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  dataRowHeight: 60,
                                  columns: const [
                                    DataColumn(
                                        label: Text(
                                      'Amount',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                    DataColumn(
                                        label: Text('Paid Date',
                                            style: TextStyle(fontSize: 20)))
                                  ],
                                  rows: snapshot.data!.docs.map((data) {
                                    return DataRow(cells: [
                                      DataCell(Text(data['amount'],
                                          style:
                                              const TextStyle(fontSize: 17))),
                                      DataCell(Text(
                                          formatPaidDate(data['paidDate']),
                                          style: const TextStyle(fontSize: 17)))
                                    ]);
                                  }).toList()),
                            ),
                          )),
                        );
                      }
                    }))));
  }
}
