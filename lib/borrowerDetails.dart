import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vasoolraj/widgets.dart';
import 'borrowerList.dart';

class Bname extends StatefulWidget {
  const Bname({Key? key}) : super(key: key);

  @override
  _BnameState createState() => _BnameState();
}

class _BnameState extends State<Bname> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: StreamBuilder(
        stream: addBorrowerNameStream.stream,
        builder: (context, snapshot) {
          return Text(
            snapshot.data.toString(),
            style: const TextStyle(fontSize: 40),
          );
        },
      )),
    ));
  }
}



/*StreamBuilder(
        stream: addBorrowerNameStream.stream,
        builder: (context, bName) {
          return Text("$bName");
        },
      )
*/


/*Future getBorrowerName() async {
 final docid = await FirebaseFirestore.instance.collection('borrowerDetails').docid;

}
*/


/*
Center(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.,
        builder: (context, snapshot) {
          return Text(
            snapshot.data.toString(),
            style: const TextStyle(fontSize: 40),
          );
        },
      )
      ),

*/