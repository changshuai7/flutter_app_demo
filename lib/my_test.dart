import 'package:flutter/material.dart';
import 'package:flutter_app_demo/data/list_data.dart';

var url =
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2207136865,1222916190&fm=26&gp=0.jpg';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        key: Key('my_container'),
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
            color: Colors.yellow,
            width: 5.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        alignment: Alignment.topCenter,
        margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
        padding: EdgeInsets.all(20),
        child: Text(
          '我是一个中国人我是一个中国人我是一个中国人我是一个中国人我是一个中国人我是一个中国人',
          // textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red,
            decorationStyle: TextDecorationStyle.solid,
            wordSpacing: 20,
            letterSpacing: 0,
            fontSize: 15,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textScaleFactor: 1.1,
        ),
      ),
    );
  }
}

class ImageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            color: Colors.red,
            width: 3.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(150)),
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.contain),
        ),
        // child: Image.network(
        //   '$url',
        //   // colorBlendMode: BlendMode.colorDodge,
        //   // color: Colors.red,
        //   alignment: Alignment.center,
        //   //fit: BoxFit.contain,
        //   repeat: ImageRepeat.repeatY,
        // ),
      ),
    );
  }
}

class ImageViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 300,
        // height: 300,
        // decoration: BoxDecoration(
        //   color: Colors.yellow,
        //   border: Border.all(
        //     color: Colors.red,
        //     width: 3.5,
        //   ),
        //   // borderRadius: BorderRadius.all(Radius.circular(150)),
        //   // image: DecorationImage(image: NetworkImage(url), fit: BoxFit.contain),
        // ),
        child: ClipOval(
          child: Image.asset(
            'images/2.0x/a.png',
            height: 300,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ListViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      children: [
        ListTile(
          leading: Image.network(url),
          title: Text('主标题'),
          subtitle: Text('我是一个副标题'),
          trailing: Icon(Icons.home),
          onTap: () {
            print('我被点击了');
          },
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightGreen, width: 5)),
          child: Text(
            '我是一个大标题',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 5),
          ),
          child: Image.network(
            url,
            alignment: Alignment.bottomLeft,
            fit: BoxFit.scaleDown,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 5),
          ),
          child: Image.network(
            url,
            alignment: Alignment.bottomLeft,
            fit: BoxFit.scaleDown,
          ),
        ),
        Container(
          height: 200,
          color: Colors.blue,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(3),
            children: [
              Container(
                margin: EdgeInsets.all(3),
                width: 100,
                color: Colors.green,
              ),
              Container(
                margin: EdgeInsets.all(3),
                width: 100,
                color: Colors.yellow,
              ),
              Container(
                margin: EdgeInsets.all(3),
                width: 100,
                color: Colors.red,
              ),
              Container(
                margin: EdgeInsets.all(3),
                width: 100,
                color: Colors.pink,
              ),
              Container(
                margin: EdgeInsets.all(3),
                width: 100,
                color: Colors.green,
              ),
              Container(
                margin: EdgeInsets.all(3),
                width: 100,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//动态数据ListView
class ListViewDemo2 extends StatelessWidget {
  //获取动态数据1
  List<Widget> getData1() {
    List<Widget> list = [];
    for (int i = 0; i < 20; i++) {
      list.add(Container(
        height: 50,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.blueAccent, width: 2),
        ),
        alignment: Alignment.center,
        child: Text(
          '<- 我是第 $i 条数据 ->',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ));
    }
    return list;
  }

  List<Widget> getData2() {
    List<Widget> list = [];
    for (int i = 0; i < listData.length; i++) {
      list.add(ListTile(
        title: Text(listData[i]['title']),
        subtitle: Text(listData[i]['author']),
        leading: Image.network(listData[i]['imageUrl']),
        trailing: Image.asset('images/a.png'),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: getData2(),
    );
  }
}

class ListViewDemo3 extends StatelessWidget {
  List<Widget> getData2() {
    List<Widget> list = [];
    for (int i = 0; i < listData.length; i++) {
      list.add(ListTile(
        title: Text(listData[i]['title']),
        subtitle: Text(listData[i]['author']),
        leading: Image.network(listData[i]['imageUrl']),
        // trailing: Image.asset('images/a.png'),
        trailing: Icon(Icons.home),
      ));
    }
    return list;
  }

  Widget _getItemWidget(BuildContext context, int index) {
    return getData2()[index];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getData2().length,
      // itemBuilder: (context, index) {
      //   return getData2()[index];
      // },
      itemBuilder: _getItemWidget,
    );
  }
}
