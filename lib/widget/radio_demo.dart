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
          title: Text("RadioDemo"),
        ),
        body: RadioDemo(),
      ),
    );
  }
}

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  String radioValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('男'),
              Radio(
                value: '男',
                groupValue: this.radioValue,
                activeColor: Colors.green,
                onChanged: (v) {
                  setState(() {
                    radioValue = v;
                  });
                },
              ),
              Text('女'),
              Radio(
                value: '女',
                groupValue: this.radioValue,
                activeColor: Colors.green,
                onChanged: (v) {
                  setState(() {
                    radioValue = v;
                  });
                },
              ),
            ],
          ),
          Text('结果为：${radioValue == null ? '未选择' : radioValue}'),
        ],
      ),
    );
  }
}
