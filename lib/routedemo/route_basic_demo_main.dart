import 'package:flutter/material.dart';

void main() {
  runApp(BasicRouteDemoApp());
}

// 基本路由演示
class BasicRouteDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicRoutePageHome(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class BasicRoutePageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('跳转到新页面'),
          onPressed: () {
            //导航到新路由
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BasicRoutePageNext('Hello World');
            }));
          },
        ),
      ),
    );
  }
}

class BasicRoutePageNext extends StatelessWidget {
  final String _message;

  BasicRoutePageNext(this._message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新的页面'),
      ),
      body: Center(
        child: Text('传递过来的数据：$_message'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          //返回
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
