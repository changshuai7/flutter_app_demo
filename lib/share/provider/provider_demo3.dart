import 'package:flutter/material.dart';
import 'package:flutter_app_demo/share/provider/notify_model.dart';
import 'package:provider/provider.dart';

///
///
/// 单个/多个Consumer基本使用
///
///

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
          title: Text('ProviderDemo'),
        ),
        body: ChangeNotifierProvider(
          create: (_) => Model1(),
          child: ContentWidget1(),
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('执行ContentWidget的build');
    return Column(
      children: [
        Consumer<Model1>(builder: (ctx, value, child) {
          print('执行Text更新');
          return Text('结果:${value.count}');
        }),
        RaisedButton(
          child: Text('点击增加'),
          onPressed: () {
            context.read<Model1>().increase();
          },
        )
      ],
    );
  }
}

class ContentWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('执行ContentWidget的build');
    return Column(
      children: [
        Consumer<Model1>(builder: (ctx, value, child) {
          print('执行Text1更新');
          return Text('结果1：${value.count}');
        }),
        Consumer<Model1>(builder: (ctx, value, child) {
          print('执行Text2更新');
          return Text('结果2：${value.count}');
        }),
        RaisedButton(
          child: Text('点击增加'),
          onPressed: () {
            context.read<Model1>().increase();
          },
        )
      ],
    );
  }
}

