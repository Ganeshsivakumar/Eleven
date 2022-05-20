import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/borrowerDetails.dart';
import 'package:vasoolraj/borrowerList.dart';
import 'borrowerListProvider.dart';
import 'package:provider/provider.dart';
import 'package:vasoolraj/updateNameProvider.dart';

// ignore: non_constant_identifier_names

/*borrowerCard(String BorrowerName) {
  final String firebasename;
  firebasename = BorrowerName;

  // ignore: unused_local_variable
  //late int bnindex;
  return GestureDetector(
    onTap: () {
      
     // Provider.of<UpdateNameProvider>(context).update(firebasename);
      Get.to(() => BorrowerDetails());
      print(firebasename);
    },
    child: Align(
        child: Container(
      width: 355,
      height: 63,
      decoration: ShapeDecoration(
          color: null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Card(
          elevation: 5,
          color: const Color(0xfff5f5f5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(builder: (BuildContext context) {
                return Builder(builder: (context) {
                  return Text(
                    BorrowerName,
                    style: const TextStyle(fontSize: 20),
                  );
                });
              }),
              const Icon(Icons.arrow_forward)
            ],
          )),
    )),
  );
}

*/

class BorrowerCard extends StatefulWidget {
  BorrowerCard({required this.BorrowerName});
  late String BorrowerName;
  //late String firebaseName = BorrowerName;

  @override
  State<BorrowerCard> createState() => _BorrowerCardState();
}

class _BorrowerCardState extends State<BorrowerCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.BorrowerName);
        Provider.of<UpdateNameProvider>(context, listen: false)
            .update(widget.BorrowerName);
        Get.to(() => BorrowerDetails());
        //print(firebasename);
      },
      child: Align(
          child: Container(
        width: 355,
        height: 63,
        decoration: ShapeDecoration(
            color: null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Card(
            elevation: 5,
            color: const Color(0xfff5f5f5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(builder: (BuildContext context) {
                  return Builder(builder: (context) {
                    return Text(
                      widget.BorrowerName,
                      style: const TextStyle(fontSize: 20),
                    );
                  });
                }),
                const Icon(Icons.arrow_forward)
              ],
            )),
      )),
    );
  }
}
