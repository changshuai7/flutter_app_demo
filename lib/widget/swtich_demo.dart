import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SwitchDemo"),
        ),
        body: CupertinoSwitchDemo(),
      ),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool switchFlag = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Switch(
        value: switchFlag,
        activeColor: Colors.green,
        activeTrackColor: Colors.yellow,
        inactiveThumbColor: Colors.black,
        inactiveTrackColor: Colors.grey,
        onChanged: (value) {
          setState(() {
            switchFlag = value;
          });
        },
      ),
    );
  }
}

class CupertinoSwitchDemo extends StatefulWidget {
  @override
  _CupertinoSwitchDemoState createState() => _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo> {
  bool switchFlag = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: CupertinoSwitch(
        value: switchFlag,
        activeColor: Colors.pinkAccent,
        onChanged: (value) {
          setState(() {
            switchFlag = value;
          });
        },
      ),
    );
  }
}
