import 'package:flutter/material.dart';
import 'package:flutter_app_demo/share/provider/notify_model.dart';
import 'package:provider/provider.dart';

///
/// 获取共享数据所用的BuildContext，必须是声明Provider所在组件的BuildContext的Element子树。
/// 换句话说，就是获取共享数据的Widget，必须是声明Provider的Widget的子组件，同级组件也不可以。
/// 比如如下代码会直接报错
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
        body: ContentWidget(),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('执行ContentWidget的build');
    return ChangeNotifierProvider(
        create: (_) => Model1(),
        child: Column(
          children: [
            Text('结果:${context.watch<Model1>().count}'),
            RaisedButton(
              child: Text('点击增加'),
              onPressed: () {
                context.read<Model1>().increase();
              },
            ),
          ],
        ));
  }
}