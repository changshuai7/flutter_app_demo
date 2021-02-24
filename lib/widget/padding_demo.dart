import 'package:flutter/material.dart';
import 'package:flutter_app_demo/data/list_data.dart';

class PaddingDemo1 extends StatelessWidget {
  List<Widget> _getData() {
    return listData.map((item) {
      return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          child: Image.network(
            item['imageUrl'],
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: _getData(),
      ),
    );
  }
}
