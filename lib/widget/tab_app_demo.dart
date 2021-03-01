import 'package:flutter/material.dart';

class TabAppDemo extends StatefulWidget {
  @override
  _TabAppDemoState createState() => _TabAppDemoState();
}

class _TabAppDemoState extends State<TabAppDemo> {
  int _currentIndex = 0;
  List<Widget> _pageList = [TabHome(), TabMine(), TabSetting()];
  List<BottomNavigationBarItem> _barList = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的")),
    BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置")),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyFlutter"),
        ),
        body: this._pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: _barList,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

/////////////////////////// TAB ///////////////////////////

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home首页'),
    );
  }
}

class TabMine extends StatefulWidget {
  @override
  _TabMineState createState() => _TabMineState();
}

class _TabMineState extends State<TabMine> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Mine我的'),
    );
  }
}

class TabSetting extends StatefulWidget {
  @override
  _TabSettingState createState() => _TabSettingState();
}

class _TabSettingState extends State<TabSetting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Setting设置'),
    );
  }
}
