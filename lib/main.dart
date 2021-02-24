import 'package:flutter/material.dart';
import 'package:flutter_app_demo/data/list_data.dart';
import 'package:flutter_app_demo/my_test.dart';
import 'package:flutter_app_demo/widget/center_demo.dart';
import 'package:flutter_app_demo/widget/container_and_text_demo.dart';
import 'package:flutter_app_demo/widget/grid_view_demo.dart';
import 'package:flutter_app_demo/widget/image_demo.dart';
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
        body: ListViewDemo3(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
