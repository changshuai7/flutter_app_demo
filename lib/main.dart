import 'package:flutter/material.dart';
import 'package:flutter_app_demo/widget/center_demo.dart';
import 'package:flutter_app_demo/widget/custom_scroll_view_demo.dart';
import 'package:flutter_app_demo/widget/grid_view_demo.dart';
import 'package:flutter_app_demo/widget/list_view_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return HomeContent();
    return MaterialApp(
      //页面信息
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyFlutter"),
        ),
        body: CustomScrollViewDemo1(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
