import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Eleven/Screens/borrowerDetails.dart';
import 'package:provider/provider.dart';
import 'package:Eleven/Provider/updateNameProvider.dart';
import 'package:Eleven/Screens/borrowerList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: non_constant_identifier_names

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
      onLongPress: () async {
        //  Provider.of<UpdateNameProvider>(context, listen: false)
        //.update(widget.BorrowerName);
        await deleteborrowerinstance
            .collection('lender')
            .doc(auth.currentUser?.uid)
            .collection('borrowers')
            .where('Name', isEqualTo: widget.BorrowerName)
            .get()
            .then((snapshot) => snapshot.docs.first.reference.delete());
      },
      onTap: () {
        Provider.of<UpdateNameProvider>(context, listen: false)
            .update(widget.BorrowerName);
        Get.to(() => BorrowerDetails());
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
                    return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          widget.BorrowerName,
                          style: const TextStyle(fontSize: 20),
                        ));
                  });
                }),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.arrow_forward),
                )
              ],
            )),
      )),
    );
  }
}
