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
          title: Text("TextFieldDemo"),
        ),
        body: CheckBoxListTileDemo(),
      ),
    );
  }
}

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool isCheckFlag = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: this.isCheckFlag,
            checkColor: Colors.red,
            activeColor: Colors.green,
            onChanged: (v) {
              setState(() {
                isCheckFlag = v;
              });
            },
          ),
          Text('结果为：${isCheckFlag ? "选中" : "未选中"}'),
        ],
      ),
    );
  }
}

class CheckBoxListTileDemo extends StatefulWidget {
  @override
  _CheckBoxListTileDemoState createState() => _CheckBoxListTileDemoState();
}

class _CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  bool isCheckFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1),
      ),
      child: CheckboxListTile(
        value: isCheckFlag,
        onChanged: (v) {
          setState(() {
            isCheckFlag = v;
          });
        },
        checkColor: Colors.red,
        activeColor: Colors.green,
        title: Text('主标题'),
        subtitle: Text('我是一个副标题：${isCheckFlag ? "选中" : "未选中"}'),
        secondary: Icon(Icons.home),
        selected: this.isCheckFlag,
      ),
    );
  }
}
