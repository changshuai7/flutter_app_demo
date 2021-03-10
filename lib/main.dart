import 'package:flutter/material.dart';
import 'package:flutter_app_demo/api/date_time_demo.dart';
import 'package:flutter_app_demo/data/list_data.dart';
import 'package:flutter_app_demo/widget/aspect_ratio.dart';
import 'package:flutter_app_demo/widget/button_demo.dart';
import 'package:flutter_app_demo/widget/card_demo.dart';
import 'package:flutter_app_demo/widget/center_demo.dart';
import 'package:flutter_app_demo/widget/container_and_text_demo.dart';
import 'package:flutter_app_demo/widget/row_column_expanded_demo.dart';
import 'package:flutter_app_demo/widget/grid_view_demo.dart';
import 'package:flutter_app_demo/widget/image_demo.dart';
import 'package:flutter_app_demo/widget/list_view_demo.dart';
import 'package:flutter_app_demo/widget/padding_demo.dart';
import 'package:flutter_app_demo/widget/st_full_demo.dart';
import 'package:flutter_app_demo/widget/stack_demo.dart';
import 'package:flutter_app_demo/widget/wrap_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MyFlutter"),
        ),
        body: DateTimeDemo(),
      ),
    );
  }
}
