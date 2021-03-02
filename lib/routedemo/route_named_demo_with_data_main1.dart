import 'package:flutter/material.dart';

void main() {
  runApp(NamedRouteDemoApp());
}

//定义待传递对象
class MyArguments {
  final String title;
  final String message;

  MyArguments(this.title, this.message);
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
                Navigator.pushNamed(context, NamedRoutePageNext.routeName,
                    arguments: MyArguments('MyTitle', 'HelloWorld!'));
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
    final MyArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${args.title}'),
      ),
      body: Center(
        child: Text('传递过来的数据：${args.message}'),
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
