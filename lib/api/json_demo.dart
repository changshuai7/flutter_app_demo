import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_app_demo/bean/user.dart';

class JsonDemo extends StatefulWidget {
  @override
  _JsonDemoState createState() => _JsonDemoState();
}

class _JsonDemoState extends State<JsonDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: [
          RaisedButton(
              child: Text('测试'),
              onPressed: () {
                ////////////////////////////////  json.decode  ////////////////////////////////

                //对象Json
                String s1 = "{\"name\":\"Tom\",\"email\":\"hello@qq.com\"}";

                //数组Json
                String s2 =
                    "[{\"name\":\"Tom\",\"email\":\"hello@qq.com\"},{\"name\":\"Jake\",\"email\":\"world@qq.com\"}]";

                print('${json.decode(s1)}');

                print('${json.decode(s2)[1]}');

                ////////////////////////////////  model序列化json  ////////////////////////////////
                // Json --> User
                String responseJson =
                    "{\"name\":\"Tom\",\"email\":\"hello@qq.com\"}";
                User user = User.fromJson(json.decode(responseJson));

                // User --> Json
                String s = json.encode(user);
              })
        ],
      ),
    );
  }
}
