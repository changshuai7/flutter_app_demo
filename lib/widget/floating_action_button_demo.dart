import 'package:flutter/material.dart';

void main() {
  runApp(FABDemo());
}

class FABDemo extends StatefulWidget {
  @override
  _FABDemoState createState() => _FABDemoState();
}

class _FABDemoState extends State<FABDemo> {
  int _currentIndex = 0;

  List<Widget> _pageList = [TABHome(), TABAdd(), TABMine()];

  List<BottomNavigationBarItem> _bottomBarList = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('添加')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    int _centerIndex = _bottomBarList.length ~/ 2;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('FAB'),
        ),
        body: this._pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: _bottomBarList,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentIndex = _centerIndex;
            });
          },
          child: Icon(Icons.add),
          backgroundColor:
              _currentIndex == _centerIndex ? Colors.green : Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class TABHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home首页'),
    );
  }
}

class TABAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Add添加页'),
    );
  }
}

class TABMine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Mine我的'),
    );
  }
}
