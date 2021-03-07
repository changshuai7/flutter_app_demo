import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '-------- Button演示 --------',
            style: TextStyle(color: Colors.red),
          ),
          BtnShow(),
          Text(
            '-------- Button带图标演示 --------',
            style: TextStyle(color: Colors.red),
          ),
          BtnShowWithIcon(),
          Text(
            '-------- Button测试 --------',
            style: TextStyle(color: Colors.red),
          ),
          BtnTest(),
          Text(
            '-------- ShapeBorder测试 --------',
            style: TextStyle(color: Colors.red),
          ),
          ShapeBorderTest(),
        ],
      ),
    );
  }
}

class BtnShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        RaisedButton(
          onPressed: () {},
          child: Text('RaisedButton'),
        ),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          onPressed: () {},
          child: Text('FlatButton'),
        ),
        SizedBox(
          width: 5,
        ),
        OutlineButton(
          onPressed: () {},
          child: Text('OutlineButton'),
        ),
        SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.thumb_up),
        ),
      ],
    );
  }
}

class BtnShowWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        RaisedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: () {},
        ),
        SizedBox(
          width: 5,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text("添加"),
          onPressed: () {},
        ),
        SizedBox(
          width: 5,
        ),
        FlatButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),
          onPressed: () {},
        ),
      ],
    );
  }
}

class BtnTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 50,
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.yellow,
            disabledColor: Colors.grey,
            splashColor: Colors.green,
            highlightColor: Colors.black,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            onPressed: () {},
            child: Text('我是一个Button'),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 100,
          height: 100,
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.yellow,
            disabledColor: Colors.grey,
            splashColor: Colors.green,
            highlightColor: Colors.black,
            padding: EdgeInsets.all(10),
            shape: CircleBorder(side: BorderSide(color: Colors.red, width: 3)),
            onPressed: () {},
            child: Text(
              '我是一个Button',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class ShapeBorderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyShapeBtn(
            BeveledRectangleBorder(
                side: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            'BeveledRectangleBorder'),
        MyShapeBtn(
            CircleBorder(
              side: BorderSide(color: Colors.red, width: 1),
            ),
            'CircleBorder'),
        MyShapeBtn(
            RoundedRectangleBorder(
              side: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            'RoundedRectangleBorder'),
        MyShapeBtn(
            StadiumBorder(
              side: BorderSide(color: Colors.red, width: 1),
            ),
            'StadiumBorder'),
      ],
    );
  }
}

class MyShapeBtn extends StatelessWidget {
  final ShapeBorder shape;
  final String des;

  MyShapeBtn(this.shape, this.des);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        width: 200,
        height: 50,
        child: RaisedButton(
          shape: this.shape,
          onPressed: () {},
          child: Text(this.des),
        ),
      ),
    );
  }
}
