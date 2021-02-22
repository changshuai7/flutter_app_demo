
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/data/ListData.dart';

//最简单的GridView
class GridViewHomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, //控制网格布局有几列，这里显示
      children: <Widget>[
        Text("这是一个文本"),
        Text("这是一个文本"),
        Text("这是一个文本"),
        Text("这是一个文本"),
        Text("这是一个文本"),
        Text("这是一个文本"),
        Text("这是一个文本"),
        Text("这是一个文本"),
      ],
    );
  }
}

//GridView.count添加循环数据
class GridViewHomeContent2 extends StatelessWidget {
  List<Widget> _getListData() {
    List<Widget> list = new List();
    for (var i = 0; i < 20; i++) {
      list.add(Container(
        alignment: Alignment.center,
        child: Text(
          "第$i条数据",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        color: Colors.blue,
        height: 100, //设置高度是无效的。只可一个根据childAspectRatio来设置宽高的比例。
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      //控制网格布局有几列，这里显示
      crossAxisCount: 3,
      //水平网格间距
      crossAxisSpacing: 10.0,
      //竖直网格间距
      mainAxisSpacing: 10.0,
      //整体边距
      padding: EdgeInsets.all(10),
      //设置宽高比例:宽度/高度
      childAspectRatio: 0.7,

      children: _getListData(),
    );
  }
}

//GridView.count添加外部数据
class GridViewHomeContent3 extends StatelessWidget {
  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      //ListView会平铺。但是Column不会,是多少大小就是多少大小
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(value['imageUrl']),
            SizedBox(
              height: 10, //SizedBox主要是用于撑开一个距离
            ),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromRGBO(100, 100, 100, 1), width: 2)),
      );
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children: _getListData(),
    );
  }
}

//GridView.builder实现网格布局
class GridViewHomeContent4 extends StatelessWidget {
  Widget _getListData(BuildContext context, int index) {
    var value = listData[index];
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(value['imageUrl']),
          SizedBox(
            height: 10,
          ),
          Text(
            value['title'],
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 18),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //这些参数在builder中不能直接配置，必须通过gridDelegate内配置才行
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: listData.length,
      itemBuilder: this._getListData,
    );
  }
}
