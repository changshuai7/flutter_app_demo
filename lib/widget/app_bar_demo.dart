import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        AppBarPage.routeName: (context) => AppBarPage(),
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
      body: Center(
        child: RaisedButton(
          child: Text('点击跳转'),
          onPressed: () {
            Navigator.of(context).pushNamed(AppBarPage.routeName);
          },
        ),
      ),
    );
  }
}

class AppBarPage extends StatelessWidget {
  static const routeName = '/AppBarPage';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("AppBarPage"),
            centerTitle: true,
            bottom: TabBar(tabs: <Widget>[
              Tab(text: 'A'),
              Tab(text: 'B'),
              Tab(text: 'C'),
            ]),
          ),
          //切换tab的view
          body: TabBarView(children: <Widget>[
            Text('PageA'),
            Text('PageB'),
            Text('PageC'),
          ]),
        ));
  }
}
