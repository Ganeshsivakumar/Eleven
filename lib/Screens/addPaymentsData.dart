import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:Eleven/Provider/updateNameProvider.dart';
import 'package:Eleven/Screens/borrowerDetails.dart';
import 'package:Eleven/Screens/borrowerList.dart';
import 'package:Eleven/Widgets/widgets.dart';
import 'package:Eleven/constants.dart';

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
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            // titleSpacing: 40,
            elevation: 0,
            backgroundColor: Colors.white10,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: NavigationArrow(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.to(() => const BorrowerDetails());
                  },
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kAddPaymentsDataText,
              const SizedBox(
                height: 50,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: amountpaidController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(6)
                ],
                decoration: kTextFieldDecocation.copyWith(hintText: 'Amount '),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                // textAlign: TextAlign.center,
                keyboardType: TextInputType.datetime,
                controller: paidDateController,
                onTap: () async {
                  DateTime? PickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2026),
                      helpText: 'Select Paid Date',
                      builder: (context, child) {
                        return Theme(
                            data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.light().copyWith(
                                    surface: Color(0xff8eacbb),
                                    primary: Color(0xff607d8b))),
                            child: child!);
                      });
                  if (PickedDate != null) {
                    setState(() {
                      paidDateController.text =
                          PickedDate.toString().replaceAll("00:00:00.000", "");
                      paidDate = PickedDate;
                    });
                  } else {
                    Get.snackbar('Error', 'Pick paid date',
                        backgroundColor: Colors.red);
                  }
                },
                decoration:
                    kTextFieldDecocation.copyWith(hintText: 'Paid Date'),
              ),
              const SizedBox(
                height: 50,
              ),
              Builder(
                builder: (context) {
                  return RoundedRectangleButton(
                      title: 'Save',
                      onPressed: () {
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
                                .doc(auth.currentUser?.uid)
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
