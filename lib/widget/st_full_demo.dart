import 'package:flutter/material.dart';

class STFullDemo1 extends StatelessWidget {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(10),
        width: 200,
        height: 200,
        child: Column(
          children: [
            Text('${this.count}'),
            RaisedButton(
                child: Text('增加'),
                onPressed: () {
                  this.count++;
                  print('count = ${this.count}');
                })
          ],
        ),
      ),
    );
  }
}

class STFullDemo2 extends StatefulWidget {
  @override
  _STFullDemo2State createState() => _STFullDemo2State();
}

class _STFullDemo2State extends State<STFullDemo2> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(10),
        width: 200,
        height: 200,
        child: Column(
          children: [
            Text('${this.count}'),
            RaisedButton(
                child: Text('增加'),
                onPressed: () {
                  setState(() {
                    this.count++;
                    print('count = ${this.count}');
                  });
                })
          ],
        ),
      ),
    );
  }
}

class STFullDemo3 extends StatefulWidget {
  @override
  _STFullDemo3State createState() => _STFullDemo3State();
}

class _STFullDemo3State extends State<STFullDemo3> {
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
            child: Text('增加列表条目'),
            onPressed: () {
              setState(() {
                list.add('${new DateTime.now()}');
              });
            }),
        Expanded(//Expanded会将列表填充到剩余空间
          child: ListView(
            children: list.map((item) {
              return ListTile(
                title: Text('$item'),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
