import 'package:flutter/material.dart';
import 'package:flutter_app_demo/data/list_data.dart';

class CardDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          color: Colors.yellow,
          shadowColor: Colors.green,
          elevation: 10,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('张三'),
                subtitle: Text('高级开发工程师'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                child: Text(
                  '电话：18888888888',
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                child: Text(
                  '地址：北京市朝阳区',
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('李四'),
                subtitle: Text('中级开发工程师'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                child: Text(
                  '电话：13555555555',
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                child: Text(
                  '地址：北京市大兴区',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CardDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: listData.map((item) {
      return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 20 / 9,
              child: Image.network(
                item['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item['imageUrl']),
              ),
              title: Text(item['title']),
              subtitle: Text(item['author']),
            )
          ],
        ),
      );
    }).toList());
  }
}

class CircleAvatarDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('${listData.toList()[0]['imageUrl']}'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundColor: Colors.red,
          ),
        ),
        CircleAvatar(
            backgroundImage:
                NetworkImage('${listData.toList()[0]['imageUrl']}'),
            radius: 60),
        CircleAvatar(
            backgroundImage:
                NetworkImage('${listData.toList()[0]['imageUrl']}'),
            radius: 30),
      ],
    );
  }
}
