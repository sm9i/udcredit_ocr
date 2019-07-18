import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:udcredit_ocr/udcredit_ocr.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await UdcreditOcr.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  String test = "2";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
              Text('Running on: $test\n'),
              FlatButton(
                onPressed: () {
                  UdcreditOcr.init(
                          outOrderId: "orderId",
                          authKey: "da25ca7e-80b2-40e1-8d47-c6bf21dbb57c")
                      .then((data) {
                    print("FLUTTER-$data");
                    setState(() {
                      test = data.retMsg+data.retCode;
                    });
                  });
                },
                child: Text("init"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
