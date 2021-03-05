import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        NextPage.routeName: (context) => NextPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            //DrawerHeaderTest(),
            UserAccountsDrawerHeaderTest(),
            ListTile(
              title: Text("个人中心"),
              leading: Icon(Icons.person),
              onTap: () {
                //关闭Drawer
                Navigator.of(context).pop();
                //打开新路由页面
                Navigator.of(context).pushNamed(NextPage.routeName);
              },
            ),
            Divider(),
            ListTile(
              title: Text("设置"),
              leading: Icon(Icons.home),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class DrawerHeaderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://www.itying.com/images/flutter/1.png'),
            ),
          ),
          Text('我的账户'),
        ],
      ),
    );
  }
}

class UserAccountsDrawerHeaderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: CircleAvatar(
        backgroundImage:
            NetworkImage('https://www.itying.com/images/flutter/1.png'),
      ),
      otherAccountsPictures: [
        Image.network('https://www.itying.com/images/flutter/2.png'),
        Image.network('https://www.itying.com/images/flutter/3.png'),
      ],
      accountName: Text('王小明'),
      accountEmail: Text('hello_flutter@163.com'),
    );
  }
}

class NextPage extends StatelessWidget {
  static const routeName = '/NextPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人中心"),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////

// 演示手动打开Drawer
class DrawerOpenTest extends StatefulWidget {
  static const routeName = '/DrawerOpenTest';

  @override
  _DrawerOpenTestState createState() => new _DrawerOpenTestState();
}

class _DrawerOpenTestState extends State<DrawerOpenTest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(),
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
      ),
    );
  }
}
