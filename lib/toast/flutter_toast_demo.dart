import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          title: Text("FlutterToastDemo"),
        ),
        body: FlutterToastDemo(),
      ),
    );
  }
}

class FlutterToastDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          Btn(
            'ShowToast',
            onPress: () {
              Fluttertoast.showToast(
                msg: '我是一个Toast',
                toastLength: Toast.LENGTH_LONG,
                fontSize: 20,
                backgroundColor: Colors.green,
                gravity: ToastGravity.CENTER,
              );
            },
          ),
          Btn(
            'CancelToast',
            onPress: () {
              Fluttertoast.cancel();
            },
          ),
        ],
      ),
    );
  }
}

class Btn extends StatelessWidget {
  final onPress;
  final String text;

  Btn(this.text, {this.onPress});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(
          this.text,
          textAlign: TextAlign.center,
        ),
        color: Theme.of(context).accentColor,
        colorBrightness: Brightness.dark,
        onPressed: this.onPress);
  }
}
