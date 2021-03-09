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
        body: RadioListTileDemo(),
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

class RadioListTileDemo extends StatefulWidget {
  @override
  _RadioListTileDemoState createState() => _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  String radioValue;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: RadioListTile(
            groupValue: radioValue,
            value: '男',
            onChanged: (v) {
              setState(() {
                radioValue = v;
              });
            },
            activeColor: Colors.green,
            title: Text('男'),
            subtitle: Text('我是一个副标题'),
            secondary: Icon(Icons.home),
            selected: radioValue == '男',
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: RadioListTile(
            groupValue: radioValue,
            value: '女',
            onChanged: (v) {
              setState(() {
                radioValue = v;
              });
            },
            activeColor: Colors.green,
            title: Text('女'),
            subtitle: Text('我是一个副标题'),
            secondary: Icon(Icons.home),
            selected: radioValue == '女',
          ),
        ),
        Text('结果为：${radioValue == null ? '未选择' : radioValue}'),
      ],
    );
  }
}
