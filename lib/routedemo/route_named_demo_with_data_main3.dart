import 'package:flutter/material.dart';

void main() {
  runApp(NamedRouteDemoApp());
}

//维护一个路由配置Map
//key为路由名称，value为创建路由对象并传递参数的的Function
var routeConfig = {
  NamedRoutePageNext.routeName: ({args}) => NamedRoutePageNext(args: args),
};

class NamedRouteDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NamedRoutePageHome(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (RouteSettings settings) {
        final Function routeBuilder = routeConfig[settings.name];
        if (routeBuilder != null) {
          if (settings.arguments != null) {
            return MaterialPageRoute(
              builder: (context) => routeBuilder(args: settings.arguments),
            );
          } else {
            return MaterialPageRoute(builder: (context) => routeBuilder());
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

  final Map args;

  //通过构造方法传入对应参数
  NamedRoutePageNext({this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${args != null ? args['title'] : ''}'),
      ),
      body: Center(
        child: Text('传递过来的数据：${args != null ? args['message'] : ''}'),
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
