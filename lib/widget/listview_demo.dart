//垂直列表：ListTile
import 'package:flutter/material.dart';

import '../data/list_data.dart';

class ListViewHomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577359381804&di=bf467cdc5e6d366825a59ab4c1edc2bb&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D2348394515%2C2895775719%26fm%3D214%26gp%3D0.jpg";
    var imageUrl2 =
        "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg";
    var imageUrl3 =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577958971&di=dbdc9d5c67a9de5afa16588d590a9e61&imgtype=jpg&er=1&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fbaike%2Fcrop%253D0%252C68%252C190%252C270%253Bw%253D138%253Bq%253D95%2Fsign%3D1a6070f50bfa513d45e5369e005d79cd%2Fb7003af33a87e950bec5164513385343faf2b4cd.jpg";

    return ListView(
      padding: EdgeInsets.all(10), //设置padding
      children: <Widget>[
        //可以放置任何组件(Image/Text/Container等)，
        //但是一般配合ListTile来使用
        ListTile(
          //后置图标
          trailing: Icon(
            Icons.home,
            color: Colors.red,
            size: 30,
          ),
          //前置图标
          leading: Image.network(imageUrl),
          //标题
          title: Text(
            "人人车上市了",
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          //副标题
          subtitle: Text("这是二级标题111"),
          onTap: () {
            print('Item被点击了');
          },
        ),
        ListTile(
          title: Text("我爱人人车"),
          subtitle: Text("这是二级标题222"),
        ),
        ListTile(
          title: Text("人人车爱我"),
          subtitle: Text("这是二级标题333"),
        ),
      ],
    );
  }
}

//垂直图文列表
class ListViewHomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl4 =
        "https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1577378688&di=89d6c0ce04cfd3d5a79450ff23c054e9&src=http://pic1.win4000.com/wallpaper/d/59b775569da2a.jpg";
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        Container(
          height: 50,
          child: Text(
            "我是一个标题",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
        Image.network(imageUrl4),
        Image.network(imageUrl4),
        Image.network(imageUrl4),
        Image.network(imageUrl4),
      ],
    );
  }
}

//水平列表
class ListViewHomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577359381804&di=bf467cdc5e6d366825a59ab4c1edc2bb&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D2348394515%2C2895775719%26fm%3D214%26gp%3D0.jpg";

    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 100, //在垂直列表中，设置宽度是无效的。
            color: Colors.blue,
          ),
          Container(
            width: 100,
            color: Colors.red,
            //可以继续嵌套
            child: ListView(
              children: <Widget>[
                Image.network(imageUrl),
                Text("你好1"),
                Text("你好2"),
                Text("你好3"),
                Text("你好4"),
                Text("你好5"),
                Text("你好6"),
                Text("你好7"),
              ],
            ),
          ),
          Container(
            width: 100,
            color: Colors.yellow,
          ),
          Container(
            width: 100,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

//通过循环动态添加列表数据
class ListViewHomeContent4 extends StatelessWidget {
  List<Widget> _getData() {
    List<Widget> list = new List();
    for (var i = 0; i < 20; i++) {
      list.add(ListTile(
        title: Text("Item-->第$i条数据"),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getData(),
    );
  }
}

//通过外部数据添加列表数据
class ListViewHomeContent5 extends StatelessWidget {
  List<Widget> _getData() {
    var tempList = listData.map((value) {
      return ListTile(
        title: Text(value['title']),
        leading: Image.network(value['imageUrl']),
        subtitle: Text(value['author']),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getData(),
    );
  }
}

//通过ListView.builder动态添加列表数据
class ListViewHomeContent6 extends StatelessWidget {
  List<String> list = new List();

  //通过构造方法先初始化数据
  ListViewHomeContent6() {
    for (var i = 0; i < 20; i++) {
      list.add("我是第$i条数据");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length, //配置长度
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            this.list[index],
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}

//通过ListView.builder动态添加列表外部的数据
class ListViewHomeContent7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: this._getItemWidget, //这里只是把方法赋值，不是执行。不要用括号，用括号就成了执行调用改方法
    );
  }

  Widget _getItemWidget(BuildContext context, int index) {
    var value = listData[index];
    return ListTile(
      title: Text(value['title']),
      leading: Image.network(value['imageUrl']),
      subtitle: Text(value['author']),
    );
  }
}