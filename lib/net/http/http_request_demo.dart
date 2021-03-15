import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HttpDemo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("HttpDemo"),
        ),
        body: HttpDemo(),
      ),
    );
  }
}

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          RaisedButton(child: Text('请求网络'), onPressed: () {}),
          SizedBox(
            height: 20,
          ),
          Text('请求结果是：${this.result ?? '未获取结果'}')
        ],
      ),
    );
  }
}
