import 'package:flutter/material.dart';

void main() {
  runApp(NamedRouteDemoApp());
}

class NamedRouteDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NamedRoutePageHome(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == NamedRoutePageNext.routeName) {
          if (settings.arguments is Map) {
            var args = settings.arguments as Map;
            return MaterialPageRoute(
              builder: (context) => NamedRoutePageNext(
                  title: args['title'], message: args['message']),
            );
          }
        }
        return null;
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
                //导航到新路由,并传递相关值
                Navigator.of(context).pushNamed(NamedRoutePageNext.routeName,
                    arguments: {'title': 'MyTitle', 'message': 'HelloWorld'});
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

  final String title;
  final String message;

  //通过构造方法传入对应参数
  NamedRoutePageNext({this.title = '', this.message = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Center(
        child: Text('传递过来的数据：$message'),
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
