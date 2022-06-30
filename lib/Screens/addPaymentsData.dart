import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vasoolraj/Provider/updateNameProvider.dart';
import 'package:vasoolraj/Screens/borrowerDetails.dart';
import 'package:vasoolraj/Screens/borrowerList.dart';
import 'package:vasoolraj/Widgets/widgets.dart';
import 'package:vasoolraj/constants.dart';
import 'package:intl/intl.dart';

class AddpaymentsData extends StatefulWidget {
  const AddpaymentsData({Key? key}) : super(key: key);

  @override
  State<AddpaymentsData> createState() => _AddpaymentsDataState();
}

class _AddpaymentsDataState extends State<AddpaymentsData> {
  final _firestoree = FirebaseFirestore.instance;
  late DateTime paidDate;
  TextEditingController amountpaidController = TextEditingController();
  TextEditingController paidDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kAddPaymentsDataText,
                TextField(
                  keyboardType: TextInputType.number,
                  controller: amountpaidController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(6)
                  ],
                  decoration:
                      kTextFieldDecocation.copyWith(hintText: 'Amount '),
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  controller: paidDateController,
                  onTap: () async {
                    DateTime? PickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2026));
                    if (PickedDate != null) {
                      setState(() {
                        paidDateController.text = PickedDate.toString();
                        paidDate = PickedDate;
                        //DateFormat('dd-MM-yyyy')
                        //    .parse(PickedDate.toString());
                        //print(paidDate);
                      });
                    } else {
                      Get.snackbar('Error', 'Pick paid date',
                          backgroundColor: Colors.red);
                    }
                  },
                  decoration:
                      kTextFieldDecocation.copyWith(hintText: 'Paid Date'),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Builder(
                      builder: (context) {
                        return SaveButton(onPressed: () {
                          if (amountpaidController.text.isEmpty) {
                            Get.snackbar('Error:', "Amount can't be empty ",
                                backgroundColor: Colors.red);
                          } else if (paidDateController.text.isEmpty) {
                            Get.snackbar('Error:', "Date can't be empty ",
                                backgroundColor: Colors.red);
                          } else {
                            try {
                              _firestoree
                                  .collection('lender')
                                  .doc(auth.currentUser?.email)
                                  .collection('paymentData')
                                  .add({
                                'amount': amountpaidController.text,
                                'paidDate': paidDate,
                                'name': Provider.of<UpdateNameProvider>(context,
                                        listen: false)
                                    .bname,
                              });
                            } catch (e) {
                              Get.snackbar('Error', e.toString(),
                                  backgroundColor: Colors.red);
                            }
                            Get.to(() => BorrowerDetails());
                            // Navigator.pop(context);
                            amountpaidController.clear();
                            paidDateController.clear();
                          }
                        });
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
