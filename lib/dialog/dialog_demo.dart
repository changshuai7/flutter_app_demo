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
          title: Text("DialogDemo"),
        ),
        body: SystemDialogDemo(),
      ),
    );
  }
}

class SystemDialogDemo extends StatefulWidget {
  @override
  _SystemDialogDemoState createState() => _SystemDialogDemoState();
}

class _SystemDialogDemoState extends State<SystemDialogDemo> {
  String alertDialogResult;
  String simpleDialogResult;
  String bottomSheetResult;
  String myDialogResult;

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(50)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          title: Text(
            '这是标题',
            textAlign: TextAlign.center,
          ),
          content: Text('这是AlertDialog内容'),
          actions: [
            RaisedButton(
              color: Colors.blue,
              onPressed: () => Navigator.of(context).pop("Confirm"),
              child: Text('确定'),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () => Navigator.of(context).pop("Cancel"),
              child: Text('取消'),
            ),
          ],
        );
      },
    ).then((result) {
      setState(() {
        //result即为Navigator.of(context).pop([T result]) 中result的值
        alertDialogResult = result;
      });
    });
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('这是标题'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('SimpleDialog-Option1'),
                onPressed: () => Navigator.of(context).pop("Option1"),
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('SimpleDialog-Option2'),
                onPressed: () => Navigator.of(context).pop("Option2"),
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(20),
                child: Text('SimpleDialog-Option3'),
                onPressed: () => Navigator.of(context).pop("Option3"),
              ),
            ],
          );
        }).then((result) {
      setState(() {
        //result即为Navigator.of(context).pop([T result]) 中result的值
        simpleDialogResult = result;
      });
    });
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              ListTile(
                title: Text('分享到微信'),
                onTap: () => Navigator.of(context).pop("微信"),
              ),
              ListTile(
                title: Text('分享到支付宝'),
                onTap: () => Navigator.of(context).pop("支付宝"),
              ),
              ListTile(
                title: Text('分享到短信'),
                onTap: () => Navigator.of(context).pop("短信"),
              ),
            ],
          );
        }).then((result) {
      setState(() {
        //result即为Navigator.of(context).pop([T result]) 中result的值
        bottomSheetResult = result;
      });
    });
  }

  void _showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return MyDialog(
            title: '自定义弹框',
            content: '自定义弹框的内容',
            onPress: () => Navigator.of(context).pop("Close"),
          );
        }).then((result) {
      //result即为Navigator.of(context).pop([T result]) 中result的值
      setState(() {
        myDialogResult = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          Btn(
            'AlertDialog',
            onPress: () {
              _showAlertDialog(context);
            },
          ),
          Text('AlertDialog选择的结果为:${alertDialogResult ?? '未选择'}'),
          Btn(
            'SimpleDialog',
            onPress: () {
              _showSimpleDialog(context);
            },
          ),
          Text('SimpleDialog的结果为:${simpleDialogResult ?? '未选择'}'),
          Btn(
            'BottomSheet',
            onPress: () {
              _showModalBottomSheet(context);
            },
          ),
          Text('BottomSheet的结果为:${bottomSheetResult ?? '未选择'}'),
          Btn(
            '自定义Dialog',
            onPress: () {
              _showMyDialog(context);
            },
          ),
          Text('自定义Dialog的结果为:${myDialogResult ?? '未选择'}'),
        ],
      ),
    );
  }
}

class MyDialog extends Dialog {
  final String title;
  final String content;
  final onPress;

  MyDialog({this.title = '', this.content = '', this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, //透明类型
      child: Center(
        child: Container(
          color: Colors.white,
          width: 200,
          height: 200,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    this.title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )),
              Divider(),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    this.content,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              Divider(),
              RaisedButton(child: Text('关闭'), onPressed: this.onPress)
            ],
          ),
        ),
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
