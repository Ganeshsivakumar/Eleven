import 'dart:async';
import 'package:flutter/material.dart';
import 'widgets.dart';

class SampleStreams extends StatefulWidget {
  @override
  State<SampleStreams> createState() => _SampleStreamsState();
}

class _SampleStreamsState extends State<SampleStreams> {
  TextEditingController name = TextEditingController();
  StreamController nameStram = StreamController.broadcast();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: name,
            ),
            Center(
              child: SaveButton(onPressed: () {
                setState(() {
                  Stream stream = nameStram.stream;
                  stream.listen((event) {
                    print("$event");
                  });
                  nameStram.sink.add(name.text);
                  nameStrambuilder();
                });
              }),
            ),
            nameStrambuilder()
          ],
        ),
      )),
    );
  }

  nameStrambuilder() {
    return StreamBuilder(
        stream: nameStram.stream,
        builder: ((context, snapshot) {
          return Text(snapshot.data.toString(),
              style: const TextStyle(fontSize: 40));
        }));
  }
}
