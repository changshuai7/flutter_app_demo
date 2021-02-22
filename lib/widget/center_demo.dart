//Center简易组件
import 'package:flutter/material.dart';

class CenterHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "你好Flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.green,
        ),
      ),
    );
  }
}