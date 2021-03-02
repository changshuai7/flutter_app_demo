import 'package:flutter/material.dart';

void main() {
  runApp(NamedRouteDemoApp());
}

// 命名路由演示
class NamedRouteDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NamedRoutePageHome(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        NamedRoutePageNext.routeName: (context) => NamedRoutePageNext(),
      },
    );
  }
}

class NamedRoutePageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('跳转到新页面'),
              onPressed: () {
                //导航到新路由
                Navigator.pushNamed(context, NamedRoutePageNext.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NamedRoutePageNext extends StatelessWidget {
  static const routeName = '/pageNext';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新的页面'),
      ),
      body: Center(
        child: Text('这是一个新页面'),
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
