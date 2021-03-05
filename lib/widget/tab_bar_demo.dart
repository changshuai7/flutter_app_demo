import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBarPage2(),
    );
  }
}

class AppBarPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBarPage'),
          bottom: TabBar(
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: '热门',
              ),
              Tab(
                text: '推荐',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('热门内容'),
            Text('推荐内容'),
          ],
        ),
      ),
    );
  }
}

class AppBarPage2 extends StatefulWidget {
  @override
  _AppBarPage2State createState() => _AppBarPage2State();
}

class _AppBarPage2State extends State<AppBarPage2>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print('切换到Tab：${_tabController.index}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarPage'),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              text: '热门',
            ),
            Tab(
              text: '推荐',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text('热门内容'),
          Text('推荐内容'),
        ],
      ),
    );
  }
}
