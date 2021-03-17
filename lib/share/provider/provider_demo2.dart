import 'package:flutter/material.dart';
import 'package:flutter_app_demo/share/provider/notify_model.dart';
import 'package:provider/provider.dart';

///
///
/// 建议使用Provider
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
          child: ContentWidget(),
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
        Text('结果:${context.watch<Model1>().count}'),
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