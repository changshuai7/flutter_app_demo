import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        body: TextFieldControllerDemo(),
      ),
    );
  }
}

class TextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          TextField(
            inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z]"))],
          ),
          TextField(
            inputFormatters: [LengthLimitingTextInputFormatter(5)],
          ),
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            cursorWidth: 10,
            cursorRadius: Radius.circular(5),
            cursorColor: Colors.green,
            style: TextStyle(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldInputDecorationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.ac_unit),
            ),
          ),
          TextField(
            decoration: InputDecoration(labelText: '描述输入框1'),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: '描述输入框2',
                labelStyle: TextStyle(
                  color: Colors.green,
                )),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: '描述输入框3',
              hasFloatingPlaceholder: false,
            ),
          ),
          TextField(
            decoration: InputDecoration(helperText: '我是辅助文本1'),
          ),
          TextField(
            decoration: InputDecoration(
              helperText: '我是辅助文本2',
              helperStyle: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "提示文本1",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "提示文本2",
              hintStyle: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText:
                  "提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3提示文本3",
              hintMaxLines: 2,
            ),
          ),
          TextField(
            decoration: InputDecoration(errorText: "错误信息提示1"),
          ),
          TextField(
            decoration: InputDecoration(
              errorText: "错误信息提示2",
              errorStyle: TextStyle(color: Colors.green),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                errorText:
                    "错误信息提示3错误信息提示3错误信息提示3错误信息提示3错误信息提示3错误信息提示3错误信息提示3错误信息提示3错误信息提示3",
                errorMaxLines: 2),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    isDense: false,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                TextField(),
                TextField(
                  decoration:
                      InputDecoration(contentPadding: EdgeInsets.all(10)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefix: Icon(Icons.person),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              prefixText: '+86',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              suffix: Icon(Icons.remove_red_eye),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              suffixText: '.com',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              counter: Icon(Icons.done),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              counterText: '右下角提示',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.yellow,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              errorText: '错误提示信息',
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              errorText: '错误提示信息',
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              errorText: '错误提示信息',
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              enabled: false,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              enabled: true,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              enabled: false,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldControllerDemo extends StatefulWidget {
  @override
  _TextFieldControllerDemoState createState() =>
      _TextFieldControllerDemoState();
}

class _TextFieldControllerDemoState extends State<TextFieldControllerDemo> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '默认值');
    //监听输入改变
    _controller.addListener(() {
      print('输入改变：${_controller.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          TextField(
            controller: _controller,
          ),
          RaisedButton(
              child: Text('赋值'),
              onPressed: () {
                setState(() {
                  _controller.text = '12345678';
                });
              }),
          RaisedButton(
              child: Text('取值'),
              onPressed: () {
                setState(() {});
              }),
          Text(
            'TextField的值为：${_controller.text}',
          )
        ],
      ),
    );
  }
}
