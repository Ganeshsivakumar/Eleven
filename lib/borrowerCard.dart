import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/borrowerDetails.dart';

// ignore: non_constant_identifier_names
borrowerCard(String BorrowerName) {
  return GestureDetector(
    onTap: () {
      Get.to(const BorrowerDetails());
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
