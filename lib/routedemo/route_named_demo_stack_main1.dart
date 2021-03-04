import 'package:flutter/material.dart';

void main() {
  runApp(NamedRouteDemoApp());
}

var routeConfig = {
  NamedRoutePageHome.routeName: (context) => NamedRoutePageHome(),
  NamedRoutePageNext1.routeName: (context) => NamedRoutePageNext1(),
  NamedRoutePageNext2.routeName: (context) => NamedRoutePageNext2(),
  NamedRoutePageNext3.routeName: (context) => NamedRoutePageNext3(),
};

// 【PushAndRemoveUntil演示】
class NamedRouteDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamedRoutePageHome.routeName,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: routeConfig,
      // //使用onGenerateRoute，系统对于路由栈的管理会有一些问题，pushNamedAndRemoveUntil的使用会有bug.
      // onGenerateRoute: (RouteSettings settings) {
      //   Function f = routeConfig[settings.name];
      //   return MaterialPageRoute(builder: (context) => f(context));
      // },
    );
  }
}

class NamedRoutePageHome extends StatelessWidget {
  static const routeName = '/';

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
              child: Text('BTN'),
              onPressed: () {
                //导航到新路由
                Navigator.of(context).pushNamed(NamedRoutePageNext1.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NamedRoutePageNext1 extends StatelessWidget {
  static const routeName = '/pageNext1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEXT_PAGE_1'),
      ),
      body: Center(
          child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NamedRoutePageNext2.routeName);
              },
              child: Text('BTN'))),
    );
  }
}

class NamedRoutePageNext2 extends StatelessWidget {
  static const routeName = '/pageNext2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEXT_PAGE_2'),
      ),
      body: Center(
          child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    NamedRoutePageNext3.routeName,
                    ModalRoute.withName(NamedRoutePageHome.routeName));
              },
              child: Text('BTN'))),
    );
  }
}

class NamedRoutePageNext3 extends StatelessWidget {
  static const routeName = '/pageNext3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEXT_PAGE_3'),
      ),
      body: Center(child: RaisedButton(onPressed: () {}, child: Text('BTN'))),
    );
  }
}
